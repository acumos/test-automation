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
Library    json

*** Variables ***
@{deleteUserIDs}    userId01    userId02

*** Test Cases ***
Test Create Json
    ${req_dict}    Create Dictionary    name=Aimee    id=bubba    userIdList=@{deleteUserIDs}
    Log To Console    \n*** DICTIONARY ***
    Log To Console    ${req_dict}
    ${req_json}    Json.Dumps    ${req_dict}
    Log To Console    ${req_json}

