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
${homeLink}                //a[@href='#/home' and contains(text(),'HOME')] 
${addYourModelBtn}     //button[@alt='ADD YOUR MODEL NOW']
${exploreMarketPlaceBtn}        //market-home//button/a[contains(text(),'EXPLORE MARKETPLACE')]
${signInLink}            //ul[@ng-show='successfulLoginSigninSignup']//a[@class='no-outline' and contains(text(),'Sign In')]
${loginEmailAddressEntry}  //input[@name='userName']
${loginPassword}        //input[@name='userPass']
${signInButton}         //button[@ng-click='signin()']
${loginAccountInfo}    //*[@id='account-info']
${myModelIcon}        //a[@title='My Models']
${singOut}           //a[@ng-click='logout()']/span[@class='icon-logout']

${designStudioIcon}   //a[@title='Design Studio']
${designStudioTitle}  //design-studio//span[contains(text(),'Design Studio')]        
${marketPlaceIcon}     //a[@title='Marketplace']
${myModelPageTitle}    //section[@class='pageheadsection']/div/div/span
${siteAdminIcon}       //a[@title='Site Admin']
${siteAdminPageTitle}  //section//div/span[contains(text(),'Site Admin')]

${ModelDescriptionBtn_Public}    //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Description')]
${ModelDescription_text_Public}     //div[contains(@ng-show,'public')]//div[@data-placeholder='Insert text here ...']
${ModelDescription_Completed_Public}   //span[@ng-if='solutionPublicDescStatus || copiedPublicDesc' and contains(text(),'Completed')]
${ModelDescription_DoneBtn_Public}        //*[@id='public-market']//button[contains(@ng-click,'updatePublicDescription')]            
${ModelCategoryBtn_Public}      //*[@id='public-market']//h2/a[contains(text(),'Model Category')]
${SelectCategoryDrpdwn_Public}    //*[@id='public-market']//div[@ng-show='showSolCat']//md-select[@ng-model='categoryname']
${SelectModelCategory_PR_Public}        //div[text()='Classification']//ancestor::div[contains(@class,'md-active md-clickable')]//div[text()='Prediction']   
${SelectToolkitTypeDrpdwn_Public}  //div[contains(@ng-show,'public')]//div[contains(@class,'category-popover')]//md-select[@ng-model='toolkitname'] 
${SelectToolkitType_H2O_Public}    //md-select-menu[@class='_md md-overflow']//md-option[@value='H2']
${ModelCategory_Done_Public}     //*[@id='public-market']//button[contains(@ng-click,'updateSolution(); showSolCat = !showSolCat')]
${ModelCategory_Completed_Public}    //*[@id='public-market']//span[@ng-if='(solution.modelTypeName && solution.tookitTypeName)' and contains(text(),'Completed')]       
${ModelDocumentsBtn_Public}      //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Documents')]
${SkipModelDocumentsCheckbox_Public}    //div[@ng-if='!showPublicSolutionDocs']//input   #//div[@ng-if='!showSolutionDocs']//input -->Company
${SkipModel_DoneBtn_Public}        //*[@id='public-market']//button[contains(@ng-click,'skipStep(); public.close = true')]
${ModelTag_Public}     //div[@id='public-market']//input[@placeholder='Add a tag']
${ModelTagsBtn_public}    //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Model Tags')]    
${ModelTag_Completed_Public}    //div[@id='public-market']//span[@ng-if='!tags1.length<1' and contains(text(),'Completed')]
${TagPresent_Public}    //*[@id='public-market']//ul[@class='tag-list']/li[1]  
${UploadImageForModelBtn_Public}     //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Upload')]
${UploadIcon_Go_Png_Public}    //*[@id='public-market']//div[@class='iconcontainer']/img[@ng-src='images/solutions/go.png']
${UploadIcon_Done_Public}    //*[@id='public-market']//button[contains(@ng-click,'updateSolImage')]/span[contains(text(),'Done')] 
${UploadImage_Completed_Public}    //div[@id='public-market']//span[@ng-show='showSolutionImage' and contains(text(),'Completed')]               
#//body/div[10]//md-option[@ng-repeat='category in allCategory' and @value='DT']/div[2]
#//md-option[@ng-repeat='category in allCategory' and @value='DT']/div[2] 
#//div[text()='Classification']//ancestor::div[contains(@class,'md-active md-clickable')]//div[text()='Prediction']
                    

${submitToPublicationBtn_Public}           //button[contains(text(),'Submit to Publication') and contains(@ng-click,'PB')]   
${publishToPublicMarketplaceCompleted}    //a[@title='Publish to Public Marketplace']//div/ul[@class='green']/li[contains(text(),'Completed')]


${marketPlacePageTitle}    //market-place//section[@class='pageheadsection']//span[contains(text(),'Marketplace')]
${onBoardingByWebPageTitle}     //model-resource//span[contains(text(),'On-Boarding Model')]
${searchModelTxtbox}     //*[@id='module-search']
${imageToSelect}      //div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img
${manageMyModelBtn}   //button[contains(@href,'modelEdit')]
${publishToPublicMarketplaceTab}    //a[contains(@ng-click,'Publish to Public Marketplace')]
${SolutionPublishedSuccessfulMsg}   //span[contains(text(),'Solution Published Successfully')

#Company
${publishToCompanyMarketplaceTab}    //a[contains(@ng-click,'Publish to Company Marketplace')]    
${ModelDescriptionBtn_Company}    //div[contains(@ng-show,'company')]//h2/a[contains(text(),'Description')]    
${ModelDescription_text_Company}    //div[contains(@ng-show,'company')]//div[@data-placeholder='Insert text here ...']
${ModelDescription_DoneBtn_Company}    //*[@id='company-market']//button[contains(@ng-click,'updateCompanyDescription')]
${ModelDescription_Completed_Company}    //span[@ng-if='solutionCompanyDescStatus || copiedCompanyDesc' and contains(text(),'Completed')]              
${ModelCategoryBtn_Company}      //*[@id='company-market']//h2/a[contains(text(),'Model Category')]
${SelectCategoryDrpdwn_Company}   //*[@id='company-market']//div[@ng-show='showSolCat']//md-select[@ng-model='categoryname']
${SelectModelCategory_PR_Company}        //div[text()='Classification']//ancestor::div[contains(@class,'md-active md-clickable')]//div[text()='Prediction']   
${SelectToolkitTypeDrpdwn_Company}  //div[contains(@ng-show,'company')]//div[contains(@class,'category-popover')]//md-select[@ng-model='toolkitname'] 
${SelectToolkitType_H2O_Company}    //md-select-menu[@class='_md md-overflow']//md-option[@value='H2']
${ModelCategory_Done_Company}     //*[@id='company-market']//button[contains(@ng-click,'updateSolution(); showSolCat = !showSolCat')]
${ModelCategory_Completed_Company}    //*[@id='company-market']//span[@ng-if='(solution.modelTypeName && solution.tookitTypeName )' and contains(text(),'Completed')]       
${ModelDocumentsBtn_Company}      //div[contains(@ng-show,'company')]//h2/a[contains(text(),'Documents')]
${SkipModelDocumentsCheckbox_Company}       //div[@ng-if='!showSolutionDocs']//input
${SkipModel_DoneBtn_Company}        //*[@id='company-market']//button[contains(@ng-click,'skipStep();company.close = true')]
${ModelTag_Company}     //div[@id='company-market']//input[@placeholder='Add a tag']
${ModelTagsBtn_company}    //div[contains(@ng-show,'company')]//h2/a[contains(text(),'Model Tags')]
${ModelTag_Completed_Company}    //div[@id='company-market']//span[@ng-if='!tags1.length<1' and contains(text(),'Completed')]
${TagPresent_Company}    //*[@id='company-market']//ul[@class='tag-list']/li[1]
${uploadImage_Company}    //div[contains(@ng-show,'company')]//h2/a[contains(text(),'Upload')]
${UploadImageForModelBtn_Company}     //div[contains(@ng-show,'company')]//h2/a[contains(text(),'Upload')]
${UploadIcon_Go_Png_Company}    //*[@id='company-market']//div[@class='iconcontainer']/img[@ng-src='images/solutions/go.png']
${UploadIcon_Done_company}    //*[@id='company-market']//button[contains(@ng-click,'updateSolImage')]/span[contains(text(),'Done')] 
${UploadImage_Completed_company}    //div[@id='company-market']//span[@ng-show='showSolutionImage' and contains(text(),'Completed')]     
${submitToPublicationBtn_Company}           //button[contains(text(),'Submit to Publication') and contains(@ng-click,'OR')]
${publishToCompanyMarketplaceCompleted}    //a[@title='Publish to Company Marketplace']//div/ul[@class='green']/li[contains(text(),'Completed')]



${onBoardingModelIcon}                  //a[@title='Modeler Resources']
${onBoardingByWebTab}                   //md-tabs-canvas[@role='tablist']//md-tab-item[2]/span[contains(text(),'On-Boarding By Web')]
${chooseToolkitBtn}                    //span[contains(text(),'Choose Toolkit')]
${scikit_RadioBtn}                     //md-radio-button[@value='Scikit-Learn']/div[1]
${toolkitInstallationChkbox}           //input[@type='checkbox' and @ng-model='install']
${UploadModelBtn_Onboarding}                                            //span[contains(text(),'Upload Model Bundle')]
${browseBtn}    //*[@id='file']
${uploadModel_DoneBtn}    //*[@id='uploadModel']//span[contains(text(),'Done')] 