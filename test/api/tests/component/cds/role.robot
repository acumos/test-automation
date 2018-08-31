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
Documentation  Tests the /ccds/role API

Library  RequestsLibrary
Library  Collections
Library  String

# ***** THIS NEEDS TO BE REFACTORED TO USE COMMON KEYWORDS *****
# robot -d results -v ccds_user:<insert user name here> -v ccds_password:<insert password here> -v url:<insert base url with port and context path here>  tests/cds/role.robot

Suite Teardown  delete all sessions

*** Variables ***
# entered on command line
${ccds_user}
${ccds_password}
${url}
# script level variables
${session_auth_name}    roleSessionWithAuth
${session_no_auth_name}     roleSessionNoAuth


*** Test Cases ***
Validate Response Code and Message for Inadequate Credentials
    Get Roles Missing Auth      /role       401     Full authentication is required to access this resource
    Get Roles Correct User Bad Password      /role       401     Bad credentials
    Get Roles Bad User Correct Password      /role       401     Bad credentials

Fetch Roles
    Get Roles Correct User Correct Password     /role      200

*** Keywords ***
Create Session No Auth
    [Documentation]  Create a RequestsLibrary session
    [Arguments]     ${sessionAlias}
    log  "create role session no auth"
    create session   ${sessionAlias}     ${url}

Create Session With Auth
    [Documentation]  Create a RequestsLibrary session with auth creds; arguments ${user} ${password}
    [Arguments]    ${sessionAlias}      ${user}    ${password}
    log  "create role session with auth"
    ${basic_auth}=  Create List     ${user}     ${password}
    create session  ${sessionAlias}     ${url}      auth=${basic_auth}


Get Roles Missing Auth
    [Documentation]  this test omits creds and should return status=401, error=Unauthorized, message=Full authentication is required to access this resource
    [Arguments]    ${endpoint}    ${status_code}    ${response_message}
    log  "get roles missing auth"
    create session no auth      ${session_no_auth_name}
    ${response}=  get request       ${session_no_auth_name}     ${endpoint}
    ${json}=  set variable  ${response.json()}
    log  ${json}
    # verify that the response code is 401
    should be equal as strings  ${response.status_code}     ${status_code}
    # verify message
    ${message_element}=     get from dictionary     ${json}      message
    should be equal as strings  ${message_element}      ${response_message}

Get Roles Correct User Bad Password
    [Documentation]  this test omits creds and should return 401
    [Arguments]    ${endpoint}    ${status_code}    ${response_message}
    log  "Get Roles Correct User Bad Password"
    create session with auth       ${session_auth_name}      ${ccds_user}     bubba
    ${response}=  get request  ${session_auth_name}    ${endpoint}
    ${json}=  set variable  ${response.json()}
    log  ${json}
    # verify that the response code is 401
    should be equal as strings      ${response.status_code}     ${status_code}
    # verify message
    ${message_element}=     get from dictionary        ${json}      message
    should be equal as strings      ${message_element}      ${response_message}

Get Roles Bad User Correct Password
    [Documentation]  this test omits creds and should return 401
    [Arguments]    ${endpoint}    ${status_code}    ${response_message}
    log  "Get Roles Bad User Correct Password"
    create session with auth        ${session_auth_name}      bubba     ${ccds_password}
    ${response}=  get request       ${session_auth_name}    ${endpoint}
    ${json}=  set variable  ${response.json()}
    log  ${json}
    # verify that the response code is 401
    should be equal as strings      ${response.status_code}     ${status_code}
    # verify message
    ${message_element}=     get from dictionary        ${json}      message
    should be equal as strings      ${message_element}      ${response_message}

Get Roles Correct User Correct Password
    [Documentation]  this test uses legit creds and should return 200 response and collection of roles
    [Arguments]    ${endpoint}    ${status_code}
    log  "Get Roles Correct User Correct Password"
    create session with auth        ${session_auth_name}    ${ccds_user}    ${ccds_password}
    ${response}=  get request       ${session_auth_name}    ${endpoint}
    ${json}=  set variable  ${response.json()}
    log  ${json}
    # verify the response code
    should be equal as strings      ${response.status_code}     ${status_code}
    ${total_elements}=     get from dictionary        ${json}      totalElements
    should be true      ${totalElements} > 0