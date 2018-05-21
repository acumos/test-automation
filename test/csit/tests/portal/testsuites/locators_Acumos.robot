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

${marketplaceLink}  //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/marketPlace']
${modelerResorcesLink}  //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/modelerResource']        
${signIn}  //button[@ng-click='signin()']
${homeLink}                //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/home']
${addYourModelBtn}     //main[@class='mdl-layout__content initialVal ']//section//button[@alt='ADD YOUR MODEL NOW']
${exploreMarketPlaceBtn}        //main[@class='mdl-layout__content initialVal ']//section//button/a[contains(text(),'EXPLORE MARKETPLACE')]
${signInLink}            //header-nav[@class='mdl-layout__header is-casting-shadow']//ul[@ng-show='successfulLoginSigninSignup']//a[@class='no-outline' and contains(text(),'Sign In')]
${loginEmailAddressEntry}  //input[@name='userName']
${loginPassword}        //input[@name='userPass']
${signInButton}         //button[@ng-click='signin()']
${loginAccountInfo}    //*[@id='account-info']
${myModelIcon}        //a[@title='My Models']
${signOut}           //a[@ng-click='logout()']/span[@class='icon-logout']
${acumos_logo_without_login}     //header-nav[@class='mdl-layout__header is-casting-shadow']//span[@class='accumos-header-logo']/img[@title='Acumos']

${homeIcon}            //nav[@class='mdl-navigation cg-sidebar Acu-desktop-sidebar']//a[@ui-sref='home']
${designStudioIcon}   //a[@title='Design Studio']
${designStudioTitle}  //span[@class='headline mob-disblock' and contains(text(),'Design Studio')]        
${marketPlaceIcon}     //a[@title='Marketplace']
${myModelPageTitle}    //section[@class='pageheadsection mob-pageheadsection1']/div/div/span
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


${marketPlacePageTitle}    //span[@class='headline mob-disblock' and contains(text(),'Marketplace')]
${onBoardingByWebPageTitle}     //span[@class='headline mob-disblock' and contains(text(),'On-Boarding Model')]
${searchModelTxtbox}     //*[@id='module-search']
${check_Image_loaded}      //div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img
${imageToPublish_Company}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span
${imageToPublish_Public}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span   
${imageToDelete}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span
${imageToVerify}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span
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

#Delete Model 
${DeleteModelTab}        //a[contains(@title,'Delete Model')]
${DeleteButton_MyModels}    //*[@id='manage-models']//button[@title='Delete']
${DeletedModel_InMyModels}  //div[@ng-if='hideDelete']/div/div/div[@ng-show='Viewtile']/div[1]//div[@class='tilecontainer1']/label/span


#Site Admin Dashboard
${monitoring_tab}    //a[@ng-click='menuName = "Monitoring"']
${user_Management_Tab}    //a[@ng-click='menuName = "User Management"']
${site_Configuration_Tab}    //a[@ng-click='menuName = "Site Configuration"']
${federation_Tab}    //a[@ng-click='menuName = "Federation"']
${requests}    //a[@ng-click='menuName = "Requests"']
${configure_workflows}    //a[@ng-click='menuName = "Validation"']  




${onBoardingModelIcon}                  //a[@title='Modeler Resources']
${onBoardingByWebTab}                   //md-tabs-canvas[@role='tablist']//md-tab-item[2]/span[contains(text(),'On-Boarding By Web')]
${chooseToolkitBtn}                    //span[contains(text(),'Choose Toolkit')]
${ChooseToolkit_Scikit_learn_Rd_btn}    //div[@id='chooseToolKit']//md-radio-button[@value='Scikit-Learn']/div[1]
${scikit_RadioBtn}                     //md-radio-button[@value='Scikit-Learn']/div[1]
${toolkitInstallationChkbox}           //input[@type='checkbox' and @ng-model='install']
${UploadFile_Field}                    //*[@id='uploadModel']//input[@ng-model='filename']
${UploadModelBtn_Onboarding}                                            //span[contains(text(),'Upload Model Bundle')]
${uploadModel_DoneBtn}    //*[@id='uploadModel']//span[contains(text(),'Done')]

#My Model :Model details tab
${descriptionTab}        //a[@title='Description']
${signaturesTab}         //a[@title='Signatures']
${documentsTab}          //a[@title='Documents']
${versionHistoryTab}     //a[@title='Version History']           

#Manage My Model Management Options
${onboradingTab_ManageMyModel}     //a[contains(@ng-click,'On-Boarding')]
${shareWithTeamTab}    //a[contains(@title,'Share with Team')]
${Export_DeployToCloud}    //a[contains(@ng-click,'Export/Deploy to Cloud')]
${viewDownloadsTab}    //a[contains(@ng-click,'View Downloads')]
${replyToCommentsTab}    //a[contains(@ng-click,'Reply to Comments')]
                   
#Descover Acumos links
${discover_Marketplace}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/a/div[@class='discover-description']/h5[contains(text(),'Marketplace')]
${discover_DesignStudio}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/a/div[@class='discover-description']/h5[contains(text(),'Design Studio')]
${discover_SDN_ONAP}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'SDN & ONAP')]
${discover_TeamUp}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'Team Up!')]
${discover_Onborading}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'Onboard with your Preferred Toolkit')]

#Check Published Model(Public) in My Model
${check_Image_loaded_PUB}    //div[@ng-if='hidePublic']/div[1]/div[1]/div[1]/div[@class='grid-top-section']/div/figure[1]/img
${image_Published_Public}    //div[@ng-if='hidePublic']/div[1]/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]

#Check Published Model(Company) in My Model
${check_Image_loaded_COM}    //div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div/figure/img
${image_Published_Company}   //div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]

#Navigation to Account Settings Page
${accountInfo_Dropdown}        //*[@id='account-info']
${accountSetting_link}        //a[contains(text(),'Account Settings')]
${accountSetting_PageTitle}    //span[contains(text(),'Account Settings')]

#Status of Unpublished solution
${status_Unpublished}    //span[contains(text(),'Status: Unpublished')]

#UserManagement_AddUser 
${add_NewUser_Btn}    //button[@ng-click='showPopup()']      
${fname_AddUser}        //*[@ng-model='value.fname']
${lname_AddUser}        //*[@ng-model='value.lname']
${userName_AddUser}        //*[@ng-model='value.username']
${email_AddUser}        //*[@id='emailValue']
${password_AddUser}        //*[@id='password']
${confirmPass_AddUser}        //*[@ng-model='value.cpassword']
${role_AddUser_DrpDwn}        //*[@ng-model='roleValue']
${select_MLP_SystemUser}        //div[text()='MLP System User']//ancestor::div[contains(@class,"md-active")]//following-sibling::div[text()='MLP System User']/preceding-sibling::div[@class='md-container']//div[@class='md-icon']
${addBtn_AddUser}        //md-dialog[@role='dialog']//button[contains(text(),'Add')]    
${searchUser_UserManagement}    //*[contains(concat(' ', @class, ' '), 'user-mgmt-search-container')]//input[@ng-model='search']
${registeredAddUser_uname}    //tbody[@ng-repeat='val in userDetails | orderBy:orderByField:reverseSort | filter : search']/tr/td[2]
${registeredAddUser_email}    //tbody[@ng-repeat='val in userDetails | orderBy:orderByField:reverseSort | filter : search']/tr/td[3]
${registeredAddUser_role_MLPSysUser}    //tbody[@ng-repeat='val in userDetails | orderBy:orderByField:reverseSort | filter : search']/tr/td[4]/div[1]
${registeredAddUser_status}    //tbody[@ng-repeat='val in userDetails | orderBy:orderByField:reverseSort | filter : search']/tr/td[5]/label


#
${imageToDelete_Published}    //div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]                                 
    