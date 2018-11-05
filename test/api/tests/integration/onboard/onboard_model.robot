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
Documentation  Uses existing user, onboards model


Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../../resources/keywords/portal_keywords.robot
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/keywords/cds_keywords.robot
Resource  ../../../resources/variables/common.robot

# robot -d results/integration/onboard -v  onboarding_base_url:http://cognita-dev1-vm01-core.eastus.cloudapp.azure.com:8090 -v username:<existing username} -v password:<existing password>  tests/integration/onboard/onboard_model.robot

#  *****  THIS IS NOT COMPLETE!  *****
Suite Setup  create session no auth  ${session_alias}  ${onboarding_base_url}
Suite Teardown  delete all sessions

*** Variables ***
# passed in via command line
${model_dir}
${onboarding_base_url}
${username}
${password}
# defined here
${session_alias}  onboading-session


*** Test Cases ***
Onboard Model
    ${jwtToken}=  Fetch Auth Token
    Upload Model  ${jwtToken}




*** Keywords ***
Fetch Auth Token
    [Documentation]  calls /v2/auth
    ${body}=  catenate  {
    ...    "request_body": {
    ...                    "username": "${username}",
    ...                    "password": "${password}"
    ...                  }
    ...  }
    log  ${body}
    ${response}=  post request  ${session_alias}  /onboarding-app/v2/auth  data=${body}
    log  ${response}
    ${response_json}=  set variable  ${response.json()}
    log  ${response_json}
    ${response_headers}=  set variable  ${response.headers}
    log  ${response_headers}
    # this returns a RequestsCookieJar[] list
    should be equal as strings  ${response.status_code}  200
    ${jwtToken}=  get from dictionary  ${response_json}  jwtToken
    log  ${jwtToken}
    should not be empty  ${jwtToken}
    should not be equal as strings  None  ${jwtToken}
    [Return]  ${jwtToken}

Upload Model
    [Documentation]
    [Arguments]  ${jwtToken}
    # Authorization: jwtToken
    ${headers_dict}=  create dictionary  Authorization=${jwtToken}

    # need to figure out how to upload the artifacts
    post request  headers=${headers_dict}