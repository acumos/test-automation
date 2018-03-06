# ===============LICENSE_START=======================================================
# Acumos Apache-2.0
# ===================================================================================
# Copyright (C) 2017-2018 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
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
*** Variables ***

#Locators

${marketplaceLink}  //a[@ui-sref='marketPlace' and contains(text(),'MARKETPLACE')]
${modelerResorcesLink}  //a[@href='#/modelerResource' and contains(text(),'MODELER RESOURCES')]        
${signIn}  //button[@ng-click='signin()']
${designStudioIcon}   //a[@title='Design Studio']
${designStudioTitle}  //design-studio//span[contains(text(),'Design Studio')]        
${marketPlaceIcon}     //a[@title='Marketplace']
${myModelPageTitle}    //section[@class='pageheadsection']/div/div/span
${siteAdminIcon}       //a[@title='Site Admin']
${siteAdminPageTitle}  //section//div/span[contains(text(),'Site Admin')]


${addYourModelBtn}     //div[@class='track-wrapper']/div/div[2]//button[contains(text(),' ADD YOUR MODEL NOW')]
${onBoardingByWebPageTitle}     //model-resource//span[contains(text(),'On-Boarding Model')]
${exploreMarketPlaceBtn}        //div[@class='track-wrapper']/div/div[2]//button/a[contains(text(),'EXPLORE MARKETPLACE')]
${marketPlacePageTitle}    //market-place//section[@class='pageheadsection']//span[contains(text(),'Marketplace')]
${homeLink}                //a[@href='#/home' and contains(text(),'HOME')]
${acumos_logo_header}                             //a[@href='#/home']/span[@class='acumos-logo']
${signInLink}            //ul[@ng-show='successfulLoginSigninSignup']//a[@class='no-outline' and contains(text(),'Sign In')]
${loginEmailAddressEntry}  //input[@name='userName']
${loginPassword}        //input[@name='userPass']
${signInButton}         //button[@ng-click='signin()']
${loginAccountInfo}    //*[@id='account-info']
${singOut}            //a[@ng-click='logout()']/i
${myModelIcon}        //a[@title='My Models']
${privateChkBox}      //div[@class='sidebar-checkbox-container']/div[3]/md-checkbox[@value='PR']/div/div[1]
${searchModelTxt}     //*[@id='module-search']
${imageToSelect}      //div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img
${manageMyModelBtn}   //button[contains(@href,'modelEdit')]
${skipModelDescription}  //div[@ng-if='!solutionPublicDescStatus']/label/input
${skipModelCategory}     //div[@ng-if='!solution.modelTypeName || !solution.tookitTypeName']/label/input
${skipModelDocuments}    //div[@ng-if='!showSolutionDocs']/label/input
${skipImageForModel}     //div[@ng-if='!showSolutionImage']/label/input           
${publishToPublicMarketplaceTab}    //a[contains(@ng-click,'Publish to Public Marketplace')]
${submitToPublicationBtn}           //button[contains(text(),'Submit to Publication') and contains(@ng-click,'PB')]
${publishToPublicMarketplaceCompleted}  //a[contains(@ng-click,'Publish to Public Marketplace')]/div[2]/ul/li[contains(text(),'Completed')]    
${SolutionPublishedSuccessfulMsg}   //span[contains(text(),'Solution Published Successfully')


${onBoardingModelIcon}                  //a[@title='Modeler Resources']
${onBoardingByWebTab}                   //md-tabs-canvas[@role='tablist']//md-tab-item[2]/span[contains(text(),'On-Boarding By Web')]
${chooseToolkitBtn}                    //span[contains(text(),'Choose Toolkit')]
${scikit_RadioBtn}                     //md-radio-button[@value='Scikit-Learn']/div[1]
${toolkitInstallationChkbox}           //input[@type='checkbox' and @ng-model='install']
${UploadModelBtn}                                            //span[contains(text(),'Upload Model Bundle')]
${browseBtn}    //*[@id='file']
${uploadModel_DoneBtn}    //*[@id='uploadModel']//span[contains(text(),'Done')]    
