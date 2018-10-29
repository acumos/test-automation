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
Documentation  searches for site config entries
Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/variables/common.robot

Suite Setup  create session basic auth  ${cds_base_url}  ${session_alias}  ${cds_auth_user}  ${cds_auth_password}
Suite Teardown  delete all sessions

# # robot -d results/cds/site-config -v cds_auth_user:<insert user name here> -v cds_auth_password:<insert password here> tests/component/cds/site_config.robot

*** Variables ***
${session_alias}  site_config_session


*** Test Cases ***
Test Getting Site Configs
    call get config  site_config


*** Keywords ***
Call Get Config
    [Documentation]  fetches the site config with config key
    [Arguments]  ${config_key}
    [Tags]  Sanity

    ${response}=  get request  ${session_alias}  /config/${config_key}
    log  ${response}
    # verify the response code
    should be equal as strings  200  ${response.status_code}
    ${json}=  set variable  ${response.json()}
    log  ${json}
    ${key_name}=  get from dictionary  ${json}  configKey
    should be equal as strings  ${config_key}  ${key_name}



