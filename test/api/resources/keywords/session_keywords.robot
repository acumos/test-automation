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
Documentation  Common keywords for creating an HTTP session using the RequestsLibrary
...            https://github.com/bulkan/robotframework-requests/
...            http://bulkan.github.io/robotframework-requests/#Create%20Session
...            https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.txt

Library  RequestsLibrary
Library  Collections
Library  String


*** Keywords ***
Create Session No Auth
    [Documentation]  Create a RequestsLibrary session with no type of authorization
    ...              Arguments:
    ...              1) base_url: root url and port of the API; examples: http://localhost:8083 or
    ...                 http://acumos-dev1.com:8000/ccds or http://container_name:8090; this is NOT the entire endpoint!
    ...              2) session_alias: name of the session; this is generally unique to a test suite
    [Arguments]  ${session_alias}  ${base_url}
    ${headers}=  create dictionary  Content-Type=application/json
    create session  ${session_alias}  ${base_url}  headers=${headers}

Create Session Basic Auth
    [Documentation]  Create a RequestsLibrary session with Basic Auth
    ...              Arguments:
    ...              1) base_url: root url and port of the API; examples: http://localhost:8083 or
    ...                 http://acumos-dev1.com:8000/ccds or http://container_name:8090; this is NOT the entire endpoint!
    ...              2) session_alias: name of the session; this is generally unique to a test suite
    ...              3) auth_username: username for Basic Auth
    ...              4) auth_password: password for Basic Auth

    [Arguments]  ${base_url}  ${session_alias}  ${auth_username}  ${auth_password}
    ${basic_auth}=  Create List  ${auth_username}  ${auth_password}
    ${headers}=  create dictionary  Content-Type=application/json
    create session  ${session_alias}  ${base_url}  auth=${basic_auth}  headers=${headers}

Create Session Token Auth
    [Documentation]  Used for Portal calls that require token auth
    [Arguments]  ${base_url}  ${session_alias}  ${auth_token}
    ${headers}=  create dictionary  Content-Type=application/json  Authorization=${auth_token}
    log  ${headers}
    create session  ${session_alias}  ${base_url}  headers=${headers}