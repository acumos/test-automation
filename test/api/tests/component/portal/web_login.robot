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
Library  SeleniumLibrary

Suite Teardown  Close All Browsers

*** Variables ***
${marketplaceLink}  //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/marketPlace']
${modelerResorcesLink}  //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/modelerResource']
${signIn}  //button[@ng-click='signin()']
${homeLink}                //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/home']
${signInLink}            //header-nav[@class='mdl-layout__header is-casting-shadow']//ul[@ng-show='successfulLoginSigninSignup']//a[@class='no-outline' and contains(text(),'Sign In')]
${loginEmailAddressEntry}  //input[@name='userName']
${loginPassword}        //input[@name='userPass']
${signInButton}         //button[@ng-click='signin()']
${loginAccountInfo}    //*[@id='account-info']
${myModelIcon}        //a[@title='My Models']
${singOut}           //a[@ng-click='logout()']/span[@class='icon-logout']
${acumos_logo_without_login}     //header-nav[@class='mdl-layout__header is-casting-shadow']//span[@class='accumos-header-logo']/img[@title='Acumos']

${username}  aimeeu
${password}  Acumos123#
${URL}  http://cognita-dev1-vm01-core.eastus.cloudapp.azure.com/#/home
${BROWSER}  Chrome

*** Test Cases ***
Launch Browser
  Setup Browser
Header Validation
   Verify header
Login Portal
  Verify Login
Logout Portal
  Verify Logout



*** Keywords ***
Setup Browser
   Open Browser    ${URL}   ${BROWSER}
   maximize browser window
   Sleep    5s

Verify header
    Wait Until Element Is Visible    ${homeLink}  10s
    Wait Until Element Is Visible    ${marketplaceLink}    10s
    Wait Until Element Is Visible    ${modelerResorcesLink}    10s

Verify Login
    Click Link        ${homeLink}
    Wait Until Element Is Visible    ${signInLink}     15s
    Click Element        ${signInLink}
    Wait Until Element Is Visible    ${loginEmailAddressEntry}   25s
    Input Text    ${loginEmailAddressEntry}    ${username}
    Wait Until Element Is Visible    ${loginPassword}    25s
    Input Text    ${loginPassword}    ${password}
    Click Button    ${signInButton}
    Wait Until Element Is Visible    ${loginAccountInfo}    25s
    Element Should Be Visible    ${loginAccountInfo}
    ${cookies}=  set variable  get cookies
    log  ${cookies}


Verify Logout
     Wait Until Element Is Visible    ${singOut}    10s
     Click Element        ${singOut}
     Wait Until Element Is Visible    ${signInLink}     30s
     Element Should Be Visible    ${signInLink}



