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
*** Settings ***
Documentation    This is RobotFrame work script
Library    Selenium2Library
Library    OperatingSystem
Library         DateTime  
Library           Collections
Library    Screenshot
Resource    locators_Acumos.robot
Resource    resource_Acumos_data.robot 


*** Test Cases ***
Launch Browser
  Setup Browser
Header Validation
   Verify header
Discover Acumos Section
    Verify Discover Acumos Section   
Explore Marketplace Button Navigation
  Verify Explore Marketplace Button
Add Your Model Button Navigation
  Verify Add Your Model Button
Login Portal
  Verify Login
Maketplace Tab Verification  
  Verify Marketplace Tab
My Models Tab Verification
    Verify My Models tab  
Design Studio Tab Verification  
  Verify Design Studio Tab
Site Admin Tab Verification  
  Verify Site Admin Tab
Search in My Models Page
    Verify Search Functionality  
Publish Solution in Public Marketplace
    Verify To Publish Solution In Public Marketplace
To verify Already Publish Solution In Published To Public Marketplace
    Verify The Published Solution In Published To Public Marketplace           
Publish Solution in Company Marketplace
    Verify To Publish Solution In Company Marketplace
To verify Already Publish Solution In Published To Company Marketplace
    Verify The Published Solution In Published To Company Marketplace     
Model Delete In My Models
    Verify Delete Model In MyModels
Dashboard options in Site Admin
    Verify dashboard options in Site Admin
Model Details page Tabs
   Verify Model Details page Tabs
Manage My Model Management Options
   Verify Manage My Model Management Options
To Check Status Of Unpublished Solution in Model Details page
    Verify the Status of Unpublished solution in Model details page
Account Settings Page Navigation    
    Verify Navigation to Account Settings Page                               
Logout Portal
  Verify Logout
Tear Down browser
  Tear Down
  
   
*** Keywords ***
Setup Browser    #Launch web browser  i.e Firefox
   Open Browser    ${URL}   ${BROWSER}        
   Sleep    5s 
     
 Verify header    #verify header links i.e Home,Marketplace,Modeler Resources
    Wait Until Element Is Visible    ${homeLink}  10s 
    Wait Until Element Is Visible    ${marketplaceLink}    10s   
    Wait Until Element Is Visible    ${modelerResorcesLink}    10s
    
Verify Discover Acumos Section    #Verify if the links in the Discover acumos section are displayed
   Wait Until Element Is Visible    ${homeLink}  10s 
   Wait Until Element Is Visible    ${discover_Marketplace}    60s   
   Wait Until Element Is Visible    ${discover_DesignStudio}    10s
   Wait Until Element Is Visible    ${discover_SDN_ONAP}    10s 
   Wait Until Element Is Visible    ${discover_TeamUp}    10s
   Wait Until Element Is Visible    ${discover_Onborading}    10s     
       
Verify Explore Marketplace Button    #Verify MarketPlace page should displayed after clicking on Explore MarketPlace Button
     Click Link    ${homeLink}
     Wait Until Element Is Visible    ${exploreMarketPlaceBtn}      10s    
     Click Element    ${exploreMarketPlaceBtn}
     Wait Until Element Is Visible  ${marketPlacePageTitle}    10s
     Element Should Be Visible    ${marketPlacePageTitle} 
       
Verify Add Your Model Button    #Verify Modular resources  page should displayed after clicking on Add your model button
    Click Link        ${homeLink}
    Wait Until Element Is Visible    ${addYourModelBtn}      20s     
    Click Button   ${addYourModelBtn}
    Wait Until Element Is Visible    ${onBoardingByWebPageTitle}     60s
    Element Should Be Visible    ${onBoardingByWebPageTitle}  

Verify Login    #verify successful login on portal marketplace
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
  
 Verify Marketplace Tab    #Verify MarketPlace page should displayed after clicking on Marketplace Tab 
   Wait Until Element Is Visible    ${marketPlaceIcon}    10s
   Click Element    ${marketPlaceIcon}
   Wait Until Element Is Visible    ${marketPlacePageTitle}  10s
   Element Should Be Visible    ${marketPlacePageTitle}
            
Verify My Models Tab    #Verify My Models page should displayed after clicking on My Models Tab           
   Wait Until Element Is Visible    ${myModelIcon}    10s
   Click Element    ${myModelIcon}
   Wait Until Element Is Visible     ${myModelPageTitle}  10s
   Element Should Contain    ${myModelPageTitle}     My Models 

                
 Verify Design Studio Tab    #Verify Design Studio page should displayed after clicking on Design Studio Tab
    Wait Until Element Is Visible    ${designStudioIcon}   10s
    Click Element    ${designStudioIcon}
    Wait Until Element Is Visible    ${designStudioTitle}   10s
    Element Should Be Visible    ${designStudioTitle}        
 

Verify Site Admin Tab    #Verify site admin page should displayed after clicking on site admin Tab 
    Wait Until Element Is Visible    ${siteAdminIcon}   10s
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${siteAdminPageTitle}   10s
    Element Should Be Visible    ${siteAdminPageTitle}
    
Verify Search Functionality    #Verify search functionality in My Model
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Wait Until Element Is Visible    ${check_Image_loaded}     60S 
     Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}    ${SearchModelName_MyModel}    
    
Verify To Publish Solution In Public Marketplace    #Verify to publish the solution/model in public marketplace 
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon} 
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Wait Until Element Is Visible    ${check_Image_loaded}     60S
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Public}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToPublish_Public}    ${SearchModelName_Public}
     #Sleep  40s
     Click Element    ${check_Image_loaded}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${publishToPublicMarketplaceTab}    30s
     Click Element    ${publishToPublicMarketplaceTab}
     sleep   5s
     #Execute Javascript  ${modelDocumentsBtn_Public}.scrollby(0,200)}
     ${status_modelDescPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${modelDescription_Completed_Public}
     Run Keyword If      "${status_modelDescPub}" == "PASS"     Click Element    ${modelDescriptionBtn_Public}
     Run Keyword If      "${status_modelDescPub}" == "PASS"     Input Text    ${modelDescription_text_Public}    Test Desc
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Click Element    ${ModelDescription_DoneBtn_Public}
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Wait Until Element Is Visible     ${modelDescription_Completed_Public}     15s
     
     #Execute JavaScript    window.scrollTo(0,800)
     #sleep  15s
     ${status_modelCategoryPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelCategory_Completed_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Wait Until Element Is Visible    ${ModelCategoryBtn_Public}     10s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Click Element    ${ModelCategoryBtn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectCategoryDrpdwn_Public}    10s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectCategoryDrpdwn_Public}
     #Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectModelCategory_PR_Public}    10s 
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectModelCategory_PR_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitTypeDrpdwn_Public}   5s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element     ${SelectToolkitTypeDrpdwn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitType_H2O_Public}    10s 
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectToolkitType_H2O_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Enabled    ${ModelCategory_Done_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${ModelCategory_Done_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"     Wait Until Element Is Visible     ${ModelCategory_Completed_Public}    15s
     
     #Run Keyword If      " ${status_modelCategoryPub}" == "FAIL"    Execute JavaScript    window.scrollTo(0,100)
     Click Element    ${SkipModelDocumentsCheckbox_Public}
     Click Element    ${SkipModel_DoneBtn_Public}
     #sleep  10s
     #Execute JavaScript    window.scrollTo(0,800)
     ${status_TagPresentPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelTag_Completed_Public}
     Run Keyword If      "${status_TagPresentPub}" == "PASS"   Wait Until Element Is Visible     ${ModelTag_Public}    10s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Input Text   ${ModelTag_Public}   testPubTag
     sleep  5s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Click Element    ${ModelTagsBtn_public}
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Wait Until Element Is Visible    ${ModelTag_Completed_Public}    15s
     Element Should Be Visible    ${TagPresent_Public}     
     #sleep  5s
     #Execute JavaScript    window.scrollTo(0,200)
     ${status_ImageUploadedPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${UploadImage_Completed_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"   Click Element    ${UploadImageForModelBtn_Public}
     #Execute JavaScript    window.scrollTo(0,300)
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Wait Until Element Is Visible    ${UploadIcon_Go_Png_Public}     10s
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Click Element    ${UploadIcon_Go_Png_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    sleep  5s
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Click Element     ${UploadIcon_Done_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Wait Until Element Is Visible    ${UploadImage_Completed_Public}    15s
  
     Wait Until Element Is Enabled    ${submitToPublicationBtn_Public}         10s    
     Click Element    ${submitToPublicationBtn_Public}
     Wait Until Element Is Visible    ${publishToPublicMarketplaceCompleted}        10s     
     Element Should Be Visible    ${publishToPublicMarketplaceCompleted} 
     
Verify The Published Solution In Published To Public Marketplace    #Verify already published(in public) is displaying in My models in Published to Public Marketplace
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Wait Until Element Is Visible    ${check_Image_loaded_PUB}     60S
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Public} 
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${image_Published_Public}    ${SearchModelName_Public}       
         
Verify To Publish Solution In Company Marketplace    #Verify to publish the solution/model in company marketplace 
     Wait Until Element Is Visible    ${homeIcon}    10s   
     Click Link        ${homeIcon}
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon} 
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Wait Until Element Is Visible    ${check_Image_loaded}     60S
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Company}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToPublish_Company}    ${SearchModelName_Company}
     #Sleep  40s
     Click Element    ${check_Image_loaded}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${publishToCompanyMarketplaceTab}    30s
     Click Element    ${publishToCompanyMarketplaceTab}
     sleep   5s
     ${status_modelDescComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${modelDescription_Completed_Company}
     Run Keyword If      "${status_modelDescComp}" == "PASS"     Click Element    ${modelDescriptionBtn_Company}
     Run Keyword If      "${status_modelDescComp}" == "PASS"     Input Text    ${modelDescription_text_Company}    Test Desc
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Click Element    ${ModelDescription_DoneBtn_Company}
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Wait Until Element Is Visible     ${modelDescription_Completed_Company}     15s
     
     #Execute JavaScript    window.scrollTo(0,800)
     #sleep  15s
     ${status_modelCategoryComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelCategory_Completed_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Wait Until Element Is Visible    ${ModelCategoryBtn_Company}     10s
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Click Element    ${ModelCategoryBtn_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectCategoryDrpdwn_Company}    10s
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${SelectCategoryDrpdwn_Company}
     #Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectModelCategory_PR_Company}    10s 
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${SelectModelCategory_PR_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitTypeDrpdwn_Company}   5s
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element     ${SelectToolkitTypeDrpdwn_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitType_H2O_Company}    10s 
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${SelectToolkitType_H2O_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Enabled    ${ModelCategory_Done_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${ModelCategory_Done_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"     Wait Until Element Is Visible     ${ModelCategory_Completed_Company}    15s
     
     #Run Keyword If      " ${status_modelCategoryComp}" == "FAIL"    Execute JavaScript    window.scrollTo(0,100)
     Click Element    ${SkipModelDocumentsCheckbox_Company}
     Click Element    ${SkipModel_DoneBtn_Company}
     #sleep  10s
     #Execute JavaScript    window.scrollTo(0,800)
     ${status_TagPresentComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelTag_Completed_Company}
     Run Keyword If      "${status_TagPresentComp}" == "PASS"   Wait Until Element Is Visible     ${ModelTag_Company}    10s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Input Text   ${ModelTag_Company}   testComTag
     sleep  5s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Click Element    ${ModelTagsBtn_company}
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Wait Until Element Is Visible    ${ModelTag_Completed_Company}    15s
     Element Should Be Visible    ${TagPresent_Company}     
     #sleep  5s
     #Execute JavaScript    window.scrollTo(0,200)
     ${status_ImageUploadedComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${UploadImage_Completed_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"   Click Element    ${UploadImageForModelBtn_Company}
     #Execute JavaScript    window.scrollTo(0,300)
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Wait Until Element Is Visible    ${UploadIcon_Go_Png_Company}     10s
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Click Element    ${UploadIcon_Go_Png_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    sleep  5s
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Click Element     ${UploadIcon_Done_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Wait Until Element Is Visible    ${UploadImage_Completed_Company}    15s
  
     Wait Until Element Is Enabled    ${submitToPublicationBtn_Company}         10s    
     Click Element    ${submitToPublicationBtn_Company}
     Wait Until Element Is Visible    ${publishToCompanyMarketplaceCompleted}        10s     
     Element Should Be Visible    ${publishToCompanyMarketplaceCompleted}
     
Verify The Published Solution In Published To Company Marketplace    #Verify already published(in company) is displaying in My models in Published to Company Marketplace
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Wait Until Element Is Visible    ${check_Image_loaded_COM}     60S
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Company} 
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${image_Published_Company}    ${SearchModelName_Company}      
      
Verify Delete Model In MyModels    #Verify to delete the solution/model in my models
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon} 
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Wait Until Element Is Visible    ${check_Image_loaded}     60S
     Input Text    ${searchModelTxtbox}    ${DeleteModelName}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToDelete}    ${DeleteModelName}
     #Sleep  40s
     Click Element    ${check_Image_loaded}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${DeleteModelTab}    30s
     Click Element     ${DeleteModelTab}
     Wait Until Element Is Visible    ${DeleteButton_MyModels}    10s
     Click Element    ${DeleteButton_MyModels}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60S
     Input Text    ${searchModelTxtbox}    ${DeleteModelName}
     Sleep  40s
     Wait Until Element Is Visible    ${DeletedModel_InMyModels}    
     Element Should Contain    ${DeletedModel_InMyModels}     ${DeleteModelName} 

Verify dashboard options in Site Admin    #Verify the dashboard options in the site admin tab 
    Wait Until Element Is Visible    ${siteAdminIcon}    10s
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${monitoring_tab}    15s
    Element Should Be Visible   ${monitoring_tab}   
    Wait Until Element Is Visible    ${user_Management_Tab}    15s
    Element Should Be Visible    ${user_Management_Tab}    
    Wait Until Element Is Visible    ${site_Configuration_Tab}    15s
    Element Should Be Visible    ${site_Configuration_Tab}    
    Wait Until Element Is Visible    ${federation_Tab}    15s
    Element Should Be Visible    ${federation_Tab}    
    Wait Until Element Is Visible    ${requests}    15s
    Element Should Be Visible    ${requests}    
    Wait Until Element Is Visible    ${configure_workflows}    15s
    Element Should Be Visible    ${configure_workflows} 
    
Verify Model Details page Tabs    #To verify Model details page tabs
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon} 
    Wait Until Element Is Visible    ${searchModelTxtbox}   60S
    Wait Until Element Is Visible    ${check_Image_loaded}     60S    
    Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}    ${SearchModelName_MyModel}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${descriptionTab}    25s
    Element Should Be Visible   ${descriptionTab}   
    Wait Until Element Is Visible    ${signaturesTab}    15s
    Element Should Be Visible    ${signaturesTab}    
    Wait Until Element Is Visible    ${documentsTab}    15s
    Element Should Be Visible    ${documentsTab}    
    Wait Until Element Is Visible    ${versionHistoryTab}    15s
    Element Should Be Visible    ${versionHistoryTab}
    
Verify Manage My Model Management Options
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon}
    Wait Until Element Is Visible    ${searchModelTxtbox}   60S
    Wait Until Element Is Visible    ${check_Image_loaded}     60S    
    Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}    ${SearchModelName_MyModel}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${manageMyModelBtn}    60s
    Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
    Click Element       ${manageMyModelBtn}
    Wait Until Element Is Visible    ${onboradingTab_ManageMyModel}    25s
    Element Should Be Visible   ${onboradingTab_ManageMyModel}
    Wait Until Element Is Visible    ${shareWithTeamTab}    15s
    Element Should Be Visible   ${shareWithTeamTab}
    Wait Until Element Is Visible    ${publishToCompanyMarketplaceTab}    15s
    Element Should Be Visible   ${publishToCompanyMarketplaceTab}
    Wait Until Element Is Visible    ${publishToPublicMarketplaceTab}    15s
    Element Should Be Visible   ${publishToPublicMarketplaceTab}
    Wait Until Element Is Visible    ${Export_DeployToCloud}    15s
    Element Should Be Visible   ${Export_DeployToCloud}
    Wait Until Element Is Visible    ${viewDownloadsTab}    15s
    Element Should Be Visible   ${viewDownloadsTab}
    Wait Until Element Is Visible    ${replyToCommentsTab}    15s
    Element Should Be Visible   ${replyToCommentsTab}
    
Verify the Status of Unpublished solution in Model details page
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon} 
    Wait Until Element Is Visible    ${searchModelTxtbox}   60S
    Wait Until Element Is Visible    ${check_Image_loaded}     60S    
    Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}     ${SearchModelName_MyModel}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${status_Unpublished}    15s
    Element Should Be Visible    ${status_Unpublished}
    
Verify Navigation to Account Settings Page
    Wait Until Element Is Visible    ${homeIcon}    10s    
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${accountInfo_Dropdown}    10s
    Click Element    ${accountInfo_Dropdown}
    Wait Until Element Is Visible    ${accountSetting_link}    10s
    Click Link    ${accountSetting_link}
    Wait Until Element Is Visible    ${accountSetting_PageTitle}    10s
    Element Should Be Visible    ${accountSetting_PageTitle}                    
             
 Verify Logout
     Wait Until Element Is Visible    ${signOut}    10s
     Click Element        ${signOut}
     Wait Until Element Is Visible    ${signInLink}     30s
     Element Should Be Visible    ${signInLink}
               
 Tear Down   
  [Documentation]   Close all browsers
   Close All Browsers
