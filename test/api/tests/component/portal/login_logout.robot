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
Documentation  log in, log out
Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../../resources/keywords/portal_keywords.robot
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/keywords/cds_keywords.robot
Resource  ../../../resources/variables/common.robot

Suite Setup  Create Sessions
Suite Teardown  delete all sessions

# ***** THIS NEEDS TO BE REFACTORED to include more checks than just reponse status
# and to include failure cases *****

#  robot -d results/portal/login-logout -v  portal_base_url:<portal url> -v portal_admin_username:<username> -v portal_admin_password:<password> tests/portal/login_logout.robot

*** Variables ***
${login-logout-session}  login-logout-session
${cds_session}  login-cds-session
${portal_token_session}  registerPortalUser
${auth_token}

*** Test Cases ***
Existing Admin User
    ${login_response_json}=  Log In Portal User  ${portal_admin_username}  ${portal_admin_password}
    #${auth_token}=  Fetch AuthToken From CDS  ${portal_admin_username}
    #Log Out Portal User  ${login_response_json}  ${portal_admin_password}  ${auth_token}


*** Keywords ***
Create Sessions
    [Documentation]  creates two sessions: no auth for portal, basic auth for CDS
    create session basic auth  ${cds_base_url}  ${cds_session}  ${cds_auth_user}  ${cds_auth_password}
    create session no auth  ${login-logout-session}  ${portal_base_url}

Log In Portal User
    [Documentation]  log in with existing account (name, password) passed in as parameter
    ...              Arguments: portal_username, portal_password
    ...              Returns the json response body, which can be used to log out
    [Arguments]  ${portal_username}  ${portal_password}
    ${return_dict}=  call portal login  ${login-logout-session}  ${portal_username}  ${portal_password}
    ${status_code}=  get from dictionary  ${return_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${login_response_json}=  get from dictionary  ${return_dict}  response_json
    log  ${login_response_json}
    ${return_username}=  get from dictionary  ${login_response_json}  username
    should be equal as strings  ${portal_username}  ${return_username}
    ${return_fn}=  get from dictionary  ${login_response_json}  firstName
    should be equal as strings  Aimee  ${return_fn}
    ${return_ln}=  get from dictionary  ${login_response_json}  lastName
    should be equal as strings  Ukasick  ${return_ln}
    ${return_emailId}=  get from dictionary  ${login_response_json}  emailId
    should be equal as strings  aimeeu@research.att.com  ${return_emailId}
    ${return_userId}=  get from dictionary  ${login_response_json}  userId
    should not be empty  ${return_userId}
    ${return_active}=  get from dictionary  ${login_response_json}  active
    should be equal as strings  true  ${return_active}
    ${return_lastLogin}=  get from dictionary  ${login_response_json}  lastLogin
    should not be equal as strings  None  ${return_lastLogin}
    ${return_loginPassExpire}=  get from dictionary  ${login_response_json}  loginPassExpire
    should not be equal as strings  None  ${return_loginPassExpire}
    [Return]  ${login_response_json}

Fetch AuthToken From CDS
    [Documentation]  fetches newly registered user from CDS to obtain the email token
    [Arguments]  ${portal_username}
     # fetch user from CDS to get authToken
    ${searchKeyValues_dict}=  create dictionary  loginName=${portal_username}
    ${response_dict}=  call search by query parameters  ${searchKeyValues_dict}  ${cds_session}
    # response.json() returns a dictionary; the content element contains a list of dictionaries
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${json}=  get from dictionary  ${response_dict}  response_json
    ${total_elements}=  get from dictionary  ${json}  totalElements
    should be true  ${totalElements} == 1
    # get value of content key; this value is a list of dictionaries
    # ${auth_token}=  ${None}
    @{content_list}=  get from dictionary  ${json}  content
    :FOR  ${item_dict}  in  @{content_list}
    \  log  ${item_dict}
    \  ${auth_token}=  set variable  ${item_dict['authToken']}
    should not be empty  ${auth_token}
    [Return]  ${auth_token}

Log Out Portal User
    [Documentation]  log out of existing user account
    ...              Arguments: json_body, which is the user
    [Arguments]  ${login_response_json}  ${portal_password}  ${auth_token}
    log  ${login_response_json}
    log  ${auth_token}
    should not be equal as strings  None  ${login_response_json}
    # logout requires an auth session
    ${return_username}=  get from dictionary  ${login_response_json}  username
    # ${base_url}  ${session_alias}  ${auth_token}
    create session token auth  ${portal_base_url}  ${portal_token_session}  ${auth_token}
    ${return_dict}=  call portal logout  ${portal_token_session}  ${login_response_json}  ${portal_admin_password}
    ${status_code}=  get from dictionary  ${return_dict}  response_status_code
    should be equal as strings  ${status_code}  200


***  EXAMPLE LOGIN JSON RESPONSE BODY ***
|  {
|  'loginPassExpire': False,
|   'userAssignedRolesList': None,
|    'firstName': 'Aimee',
|     'lastName': 'Ukasick',
|      'emailId': 'aimeeu@research.att.com',
|       'username': 'aimeeu',
|        'password': None,
|         'active': 'true',
|          'lastLogin': 1535130414704,
|           'created': 1519427393000,
|            'modified': None,
|             'userId': '569f2a6c-101f-484b-b616-3b6ea805117d',
|              'loginName': None,
|               'orgName': None,
|                'picture': None,
|                 'jwttoken': None,
|                  'role': None,
|                   'roleId': None,
|                    'updatedRole': None,
|                     'updatedRoleId': None,
|                      'userIdList': None,
|                       'userNewRoleList': None,
|                        'userRolesList': None,
|                         'bulkUpdate': None,
|                          'apiTokenHash': None,
|                           'verifyToken': None,
|                            'status': None,
|                               'jwtToken': None
|                           }