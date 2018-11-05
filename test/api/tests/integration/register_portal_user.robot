# ===============LICENSE_START=======================================================
# Acumos Apache-2.0
# ===================================================================================
# Copyright (C) 2018 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
# ===================================================================================
# This Acumos software file is distributed by AT&T and Tech Mahindra
# under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# This file is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===============LICENSE_END=========================================================

*** Settings ***
Documentation  Creates a user using the Portal API, fetches user from common data service,
 ...           verifies user using Portal API, logs user in, updates profile

Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../resources/keywords/cds_keywords.robot
Resource  ../../resources/keywords/session_keywords.robot
Resource  ../../resources/keywords/portal_keywords.robot
Resource  ../../resources/variables/common.robot

Suite Setup  create sessions
Suite Teardown  delete all sessions


*** Variables ***
${cds_session}  registerPortalUser
${portal_session}  registerPortalUser
${user_first_name}  Betty
${user_last_name}  Boop
${user_username}  bettyboop
${user_password}  bettyboop
${user_email}  aimeeu.opensource@gmail.com



*** Test Cases ***
Test New User Registration and Login
# this could use some kind of control flow
    ${register_resp_status}=  Register New User
    ${verify_token}=  Fetch User From CDS
    Verify New User  ${verify_token}
    Log New User Into Portal

*** Keywords ***
Create Sessions
    [Documentation]  creates two sessions: no auth for portal, basic auth for CDS
    create session basic auth  ${cds_base_url}  ${cds_session}  ${cds_auth_user}  ${cds_auth_password}
    create session no auth  ${portal_session}  ${portal_base_url}

Register New User
    [Documentation]  docs
    ${response_dict}=  call register user  ${cds_session}  ${user_first_name}  ${user_last_name}  ${user_username}  ${user_password}  ${user_email}
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    [Return]  ${status_code}

Fetch User From CDS
    [Documentation]  fetches newly registered user from CDS to obtain the email token
    ${searchKeyValues_dict}=  create dictionary  loginName=${user_username}
    ${response_dict}=  call search by query parameters  ${searchKeyValues_dict}  ${cds_session}
    # response.json() returns a dictionary; the content element contains a list of dictionaries
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${json}=  get from dictionary  ${response_dict}  response_json
    ${total_elements}=  get from dictionary  ${json}  totalElements
    should be true  ${totalElements} == 1
    # get value of content key; this value is a list of dictionaries
    ${verify_token}
    @{content_list}=  get from dictionary  ${json}  content
    :FOR  ${item_dict}  in  @{content_list}
    \  log  ${item_dict}
    \  ${verify_token}=  set variable  ${item_dict['authToken']}
    should not be empty  ${verify_token}
    [Return]  ${verify_token}

Verify New User
    [Documentation]  verifies the new user with the portal, mimicking clicking
    ...              the link in the account verification email
    [Arguments]  ${verify_token}
    ${response_dict}=  call verify user  ${portal_session}  ${user_username}  ${verify_token}
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200

Log New User Into Portal
    [Documentation]  log in with newly verified user
    ${return_dict}=  call portal login  ${portal_session}  ${user_username}  ${user_password}
    ${status_code}=  get from dictionary  ${return_dict}  response_status_code
    should be equal as strings  ${status_code}  200
