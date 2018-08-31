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
Resource  ../../../resources/keywords/cds_keywords.robot
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/variables/common.robot

Suite Setup  Create Session No Auth  ${session_alias}  ${base_url_azure}
Suite Teardown  delete all sessions

*** Variables ***
# passed in on command line
${base_url_azure}
# defined here
${session_alias}  azure_session

*** Test Cases ***



*** Keywords ***
# according to the code, any kind of code exception returns a 401
Test Response Code With No Body
    [Documentation]  tests response code when no json body is included
    [Arguments]  ${endpoint}


Test Response Code With Bogus Body
    [Documentation]  tests response code when no json body is included
    [Arguments]  ${endpoint}

