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
Library  RequestsLibrary
Library  Collections
Library  String


*** Keywords ***
Call Search By Query Parameters
    [Documentation]  Searches for users using the field name - field value pairs specified as query parameters
    ...              Calls GET /ccds/user/search
    ...              Arguments:
    ...              searchKeyValues_dict: a dictionary of key=value search parameters; examples:
    ...              firstName=Aimee, loginName=testUser, lastName=Test
    ...              cds_session: the RequestsLibrary session alias to use for the request
    ...              Returns a dictionary with two entries: response_status_code and response_json
    ...              logs the parms_dict, response, and response.json()
    [Arguments]  ${searchKeyValues_dict}  ${cds_session}
    log  ${searchKeyValues_dict}
    ${response}=  get request  ${cds_session}  /ccds/user/search  params=${searchKeyValues_dict}
    log  ${response}
    log  ${response.json()}
    # response.json() returns a dictionary; the content element contains a list of dictionaries
    ${json}=  set variable  ${response.json()}
    ${return_value} =  create dictionary  response_status_code=${response.status_code}  response_json=${json}
    [Return]  ${return_value}

