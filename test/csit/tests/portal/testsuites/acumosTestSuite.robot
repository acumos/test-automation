*** Settings ***
Documentation    This is RobotFrame work script
Library    Selenium2Library
Library    OperatingSystem
Library    DateTime  
Library     Collections
Library    Screenshot
Library    String
Library    Process
Resource    locators_Acumos.robot
Resource    resource_Acumos_data.robot


    
*** Test Cases *** 
Launch Browser
  Setup Browser    
Header Validation
   Verify header  
Discover Acumos Section
    Verify Discover Acumos Section   
# Explore Marketplace Button Navigation
  # Verify Explore Marketplace Button
# Add Your Model Button Navigation 
  # Verify Add Your Model Button
Login Portal
  Verify Login              
Marketplace Tab Verification  
  Verify Marketplace Tab
My Models Tab Verification
  Verify My Models tab  
Design Studio Tab Verification  
  Verify Design Studio Tab
Site Admin Tab Verification  
   Verify Site Admin Tab
Publish request tab verification
    Verify Publish Request tab  
To verify data is sorting in ascending or descending order when user click on icons
    Verify data is sorting in ascending or descending order when user click on icons 
# To verify delete icon is displaying on the error model(not in deleted section)
    # Verify delete icon is displaying on the error model(not in deleted section)
Search in My Models Page
    Verify Search Functionality 
To verify filter by category functionality
  Verify filter by category functionality
Publish Solution in Public Marketplace
   Verify To Publish Solution In Public Marketplace
To verify Already Publish Solution In Published To Public Marketplace
    Verify The Published Solution In Published To Public Marketplace
To Verify the description available in published in public marketplace model
    Verify the description available in published in public marketplace model              
Publish Solution in Company Marketplace
   Verify To Publish Solution In Company Marketplace
To verify Already Publish Solution In Published To Company Marketplace
    Verify The Published Solution In Published To Company Marketplace
To Verify the description available in published in Company marketplace model
    Verify the description available in published in Company marketplace model        
Model Delete In My Models For Unpublished Model    
   Verify Delete Model In MyModels For Unpublished Model   
Model Delete In My Models For Published Model    
   Verify Delete Model In MyModels For Published Model    
To Publish already Published Public Model Into Company Marketplace
    Verify To Publish already Published Public Model Into Company Marketplace       
To Publish already Published Company Model Into Public Marketplace
    Verify Publishing already Published Company Model Into Public Marketplace
To verify complete model name display in the rate section on model description screen
   Verify complete model name display in the rate section on model description screen 
Dashboard options in Site Admin
   Verify dashboard options in Site Admin         
Model Details page Tabs
   Verify Model Details page Tabs
To Verify Solution ID is displaying on Model Details Page
    Verify Solution ID is displaying on Model Details Page
To Verify Solution ID is displaying on Manage My Model Page
    Verify Solution ID is displaying on Manage My Model Page        
Manage My Model Management Options
   Verify Manage My Model Management Options
To Check Status Of Unpublished Solution in Model Details page
     Verify the Status of Unpublished solution in Model details page
To Check Status Of Deleted Solution in Model Details page
     Verify the Status of Deleted solution in Model details page
To Verify that Manage My Model Button for Deleted solution is disabled     
     Verify that Manage My Model Button for Deleted solution is disabled                               
Account Settings Page Navigation    
     Verify Navigation to Account Settings Page
To Verify Adding Author Tab Is Present In Manage My Models Page
    Verify Adding Author Tab Is Present In Manage My Models Page        
Adding New Author In Manage My Models Page
    Verify Adding New Author In Manage My Models Page    
Add New User In User Management and User Activation        
   Verify adding new user in User Management and User Activation        
To verify that Manage Themes Displays Show Your Interests popup
    Verify that Manage Themes Displays Show Your Interests popup
To Verify the user is able to select the theme title in Show Your Interests Popup
    Verify the user is able to select the theme title in Show Your Interests Popup    
To Verify Continue and Back button on Show Your Interests Popup
    Verify Continue and Back button on Show Your Interests Popup          
Logout Portal
  Verify Logout     
Verify Add User By Login With Newly Added User    
    Verify Add User By Login With Newly Added User
To Verify Change Password On Account Setting Page
    Verify Change Password On Account Setting Page    
Verify SignUp Functionality
    To Verify SignUp Functionality 
To Verify Login With Invalid Username and Password
    Verify Login With Invalid Username and Password
To Verify SignUp for Invalid Inputs for Username and Email
    Verify SignUp for Invalid Inputs for Username and Email             
Tear Down browser
  Tear Down


   
*** Keywords ***
Setup Browser    #Launch web browser  i.e Firefox
   Open Browser    ${URL}   ${BROWSER}       ff_profile_dir=${FF_PROFILE}
   Set Selenium Speed    1s 
   Check Header Status  #do not commit in gerrit

    
Check Header Status     #do not commit in gerrit
     ${status_header}  ${result}=    Run keyword and ignore error    Element Should Be Visible      ${homeLink}   30s  #${acumos_logo_without_login}
     Run Keyword If      "${status_header}" == "FAIL"     Refresh Page    

 Refresh Page    #do not commit in gerrit
   Reload Page
   sleep  5s
   Check Header Status
      
     
Verify header    #verify header links i.e Home,Marketplace,Modeler Resources   
    Wait Until Element Is Visible    ${homeLink}  10s 
    Wait Until Element Is Visible    ${marketplaceLink}    10s   
    Wait Until Element Is Visible    ${modelerResorcesLink}    10s

Verify Discover Acumos Section    #Verify if the links in the Discover acumos section are displayed
   Wait Until Element Is Visible    ${homeLink}  10s 
   Wait Until Keyword Succeeds  120   10    Wait Until Element Is Visible    ${discover_Marketplace}    30s     
   Wait Until Element Is Visible    ${discover_DesignStudio}    10s
   Wait Until Element Is Visible    ${discover_SDN_ONAP}    10s 
   Wait Until Element Is Visible    ${discover_TeamUp}    10s
   Wait Until Element Is Visible    ${discover_Onborading}    10s         
       
 Verify Explore Marketplace Button    #Verify MarketPlace page should displayed after clicking on Explore MarketPlace Button
     #Sleep     20s
     Click Link    ${homeLink}
     Wait Until Element Is Visible    ${exploreMarketPlaceBtn}      10s    
     Click Element    ${exploreMarketPlaceBtn}
     Wait Until Element Is Visible  ${marketPlacePageTitle}    10s
     Element Should Be Visible    ${marketPlacePageTitle} 
       
Verify Add Your Model Button
    Click Link        ${homeLink}
    Wait Until Element Is Visible    ${addYourModelBtn}      20s  
    Click Button    ${addYourModelBtn}  
    Wait Until Element Is Visible    ${onBoardingByWebPageTitle}     20s
    Element Should Be Visible    ${onBoardingByWebPageTitle}  

Verify Login    #verify successful login on portal marketplace    
    Click Link        ${homeLink}
    Wait Until Element Is Visible    ${signInLink}     15s
    Click Element        ${signInLink}
    #sleep  15s
    Wait Until Element Is Visible    ${loginEmailAddressEntry}   25s   
    Input Text    ${loginEmailAddressEntry}    ${username} 
    #sleep  15s 
    Wait Until Element Is Visible    ${loginPassword}    25s
    Input Text    ${loginPassword}    ${password}
    Click Button    ${signInButton}
    Wait Until Element Is Visible    ${loginAccountInfo}    30s
    Wait Until Keyword Succeeds  60   10    Wait Until Element Is Visible    ${loginAccountInfo}    20s
    Element Should Be Visible    ${loginAccountInfo}
    ${status_interestPopup}  ${result}=    Run keyword and ignore error    Wait Until Element Is Visible      ${interestPopup_closeBtn}    30s
    Run Keyword If      "${status_interestPopup}" == "PASS"     Click Element    ${interestPopup_closeBtn} 
  
 Verify Marketplace Tab    #Verify MarketPlace page should displayed after clicking on Marketplace Tab     
   Wait Until Element Is Visible    ${marketPlaceIcon}    10s    
   Click Element    ${marketPlaceIcon}
   Wait Until Keyword Succeeds  60   10    Wait Until Element Is Not Visible    ${overlay}    10s       
   Wait Until Keyword Succeeds  60   10    Wait Until Element Is Visible    ${marketPlacePageTitle}  10s    
   Element Should Be Visible    ${marketPlacePageTitle}

            
Verify My Models Tab  #Verify My Models page should displayed after clicking on My Models Tab.         
   Wait Until Element Is Visible    ${myModelIcon}    10s
   Double Click Element    ${myModelIcon}                            
   Wait Until Keyword Succeeds  60   10    Wait Until Element Is Visible     ${myModelPageTitle}  10s    
   Element Should Contain    ${myModelPageTitle}     My Models

                
Verify Design Studio Tab    #Verify Design Studio page should displayed after clicking on Design Studio Tab
    Wait Until Element Is Visible    ${designStudioIcon}   10s
    Click Element    ${designStudioIcon}
    Wait Until Element Is Visible    ${designStudioTitle}   10s
    Element Should Be Visible    ${designStudioTitle}        
 

Verify Site Admin Tab    #Verify site admin page should displayed after clicking on site admin Tab  
    Wait Until Element Is Visible    ${homeIcon}    10s      
    Click Link        ${homeIcon}    
    Wait Until Element Is Visible    ${siteAdminIcon}   10s
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${siteAdminPageTitle}   20s    
    Element Should Be Visible    ${siteAdminPageTitle}

Verify Publish Request tab
    Wait Until Element Is Visible    ${homeIcon}    10s      
    Click Link        ${homeIcon}    
    Wait Until Element Is Visible    ${publishRequestIcon}   10s
    Click Element    ${publishRequestIcon}
    Wait Until Element Is Visible    ${publishRequestPageTitle}   20s    
    Element Should Be Visible    ${publishRequestPageTitle}   
    
Verify data is sorting in ascending or descending order when user click on icons
    Wait Until Element Is Visible    ${homeIcon}    10s
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${publishRequestIcon}    10s
    Click Element    ${publishRequestIcon}
    Wait Until Element Is Visible    ${Model_Name}    15s
    Element Should Be Visible   ${Model_Name}
    Click Element    ${Model_Name_AscDesc}
    Wait Until Element Is Visible    ${Version}    15s
    Element Should Be Visible   ${Version}
    Click Element    ${Version_AscDesc}
    Wait Until Element Is Visible    ${Requester}    15s
    Element Should Be Visible   ${Requester}
    Click Element    ${Requester_AscDesc}
    Wait Until Element Is Visible    ${Created_Date}    25s
    Element Should Be Visible   ${Created_Date}
    Click Element    ${Created_Date_AscDesc}
    Wait Until Element Is Visible    ${Status}    15s
    Element Should Be Visible   ${Status}
    Click Element    ${Status_AscDesc}
    Wait Until Element Is Visible    ${Request_Status}    15s
    Element Should Be Visible   ${Request_Status}
    Click Element    ${Request_Status_AscDesc}
    Wait Until Element Is Visible    ${Comments}    15s
    Element Should Be Visible   ${Comments}
    Click Element    ${Comments_AscDesc}
    
    
Verify delete icon is displaying on the error model(not in deleted section)
    Wait Until Element Is Visible    ${homeIcon}    10s
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Link        ${myModelIcon}
	Wait Until Element Is Visible    ${searchModelTxtbox}   60S
    # Wait Until Element Is Visible    ${check_Err_Image_loaded}     60S
    Click Element    ${searchModelTxtbox}
    #Input Text    ${searchModelTxtbox}    #${SearchModelName_ErrorModel}
    #Wait Until Keyword Succeeds  60   10  Element Text Should Be     ${imageToVerify_Err}    ${SearchModelName_ErrorModel}
    sleep    30s
    Wait Until Element Is Visible    ${DeleteBtn}    30s
    Element Should Be Visible	${DeleteBtn}
    Click Element    ${DeleteBtn}    	
	
    
Verify Search Functionality    #Verify search functionality in My Model
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}    
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   30s
     Click Element    ${searchModelTxtbox}
     # Wait Until Element Is Visible    ${check_Image_loaded}     60s 
     Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
     Wait Until Keyword Succeeds  60   10  Element Text Should Be     ${imageToVerify}    ${SearchModelName_MyModel}   
     sleep    30s
     
     
Verify filter by category functionality 
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}    
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait until element is visible    ${filter_prediction}    10s
     Click Element     ${filter_prediction}
     Wait until element is visible    ${filter_classification}    10s
     Click Element    ${filter_classification}
     Wait until element is visible    ${filter_regression}    10s
     Click Element     ${filter_regression}
     Wait until element is visible    ${filter_dataTransformer}    10s
     Click Element     ${filter_dataTransformer}
              

Verify To Publish Solution In Public Marketplace    #Verify to publish the solution/model in public marketplace 
     Wait Until Element Is Visible    ${homeIcon}    10s   
     Click Link        ${homeIcon}                            
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Click Element    ${searchModelTxtbox}
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Public}
     Wait Until Keyword Succeeds  60   10  Element Text Should Be     ${imageToPublish_Public}    ${SearchModelName_Public}    
     Wait Until Element Is Visible    ${check_Image_loaded}    60s
     sleep   10s
     Click Element    ${check_Image_loaded}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${publishToPublicMarketplaceTab}    60s    
     Click Element    ${publishToPublicMarketplaceTab}
     sleep   15s
     ${status_modelDescPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${modelDescription_Completed_Public}
     Run Keyword If      "${status_modelDescPub}" == "PASS"     Click Element    ${modelDescriptionBtn_Public}
     Run Keyword If      "${status_modelDescPub}" == "PASS"     Input Text    ${modelDescription_text_Public}    Test Desc
     Run Keyword If      "${status_modelDescPub}" == "PASS"    Wait Until Element Is Enabled    ${ModelDescription_DoneBtn_Public}    15s                  
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Click Element    ${ModelDescription_DoneBtn_Public}
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Wait Until Element Is Visible     ${modelDescription_Completed_Public}     15s
     ${status_modelCategoryPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelCategory_Completed_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Wait Until Element Is Visible    ${ModelCategoryBtn_Public}     10s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Click Element    ${ModelCategoryBtn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectCategoryDrpdwn_Public}    10s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectCategoryDrpdwn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectModelCategory_PR_Public}    10s 
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectModelCategory_PR_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitTypeDrpdwn_Public}   5s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element     ${SelectToolkitTypeDrpdwn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitType_H2O_Public}    10s 
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectToolkitType_H2O_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Enabled    ${ModelCategory_Done_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${ModelCategory_Done_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"     Wait Until Element Is Visible     ${ModelCategory_Completed_Public}    15s
     Click Element    ${SkipModelDocumentsCheckbox_Public}
     Click Element    ${SkipModel_DoneBtn_Public}
     ${status_TagPresentPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelTag_Completed_Public}
     Run Keyword If      "${status_TagPresentPub}" == "PASS"   Wait Until Element Is Visible     ${ModelTag_Public}    10s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Click Element    ${ModelTagsBtn_public}   
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Input Text   ${ModelTag_Public}   testPubTag
     sleep  5s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Click Element    ${ModelTagsBtn_public}
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Wait Until Element Is Visible    ${ModelTag_Completed_Public}    15s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"    Click Element    ${ModelTagsBtn_public}    #added   
     Element Should Be Visible    ${TagPresent_Public}
     ${status_ImageUploadedPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${UploadImage_Completed_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"   Click Element    ${UploadImageForModelBtn_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Wait Until Element Is Visible    ${UploadIcon_Go_Png_Public}     10s
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Click Element    ${UploadIcon_Go_Png_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    sleep  5s
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Click Element     ${UploadIcon_Done_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Wait Until Element Is Visible    ${UploadImage_Completed_Public}    15s  
     Wait Until Element Is Enabled    ${submitToPublicationBtn_Public}         10s    
     Click Element    ${submitToPublicationBtn_Public}
     #added
     Wait Until Element Is Visible    ${WithdrawRequestBtn_Public}    20s
     Click Element    ${PublishRequestIcon}
     Wait Until Keyword Succeeds  60   10    Wait Until Element Is Not Visible    ${overlay}    10s
     # Execute JavaScript    window.scrollTo(0,400)
     # Wait Until Element Is Visible    ${showing_PublishReq_Drp}    10s
     # Execute JavaScript    window.scrollTo(0,400)
     # Click Element    ${showing_PublishReq_Drp}
     # Wait Until Element Is Visible    ${show_100_PublishReq}    5s
     sleep    5s
     # Execute JavaScript    window.scrollTo(0,400)
     # Click Element    ${showing_PublishReq_Drp}
     # Wait Until Element Is Visible    ${show_100_PublishReq}    5s
     # Click Element    ${show_100_PublishReq}
     # Wait Until Keyword Succeeds  60   10    Wait Until Element Is Not Visible    ${overlay}    10s         
     Wait Until Element Is Visible    ${search_PublishRequest}    10s
     Input Text    ${search_PublishRequest}    ${SearchModelName_Public}
     Wait Until Keyword Succeeds  60   10    Wait Until Element Contains    ${searchedModelNameForApproval}    ${SearchModelName_Public}    30s
     sleep    5s
     Click Element    ${approve_PublishRequest}
     Wait Until Element Is Visible    ${approveBtn}    10s
     Click Element    ${approveBtn}
     # Wait Until Element Is Visible    ${requestorStatus}  
     Wait Until Keyword Succeeds  60   10    Wait Until Element Is Visible   ${requestorStatus}    30s      
     sleep    10s 
     Element Should Contain    ${requestorStatus}    Approved   
        
     #Wait Until Element Is Visible    ${publishToPublicMarketplaceCompleted}        10s    #REMOVED     
     #Element Should Be Visible    ${publishToPublicMarketplaceCompleted}        #removed
     

Verify The Published Solution In Published To Public Marketplace    #Verify already published(in public) is displaying in My models in Published to Public Marketplace
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Wait Until Element Is Visible    ${check_Image_loaded_PUB}     60s
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Public} 
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${image_Published_Public}    ${SearchModelName_Public}       

Verify the description available in published in public marketplace model     
   Wait Until Keyword Succeeds  60   10    Wait Until Element Is Visible    ${check_Image_loaded_PUB}    30s    #changed
   Click Element    ${check_Image_loaded_PUB}
   Wait Until Element Is Visible    ${PublishedDescription_PB}    10s
   Element Should Contain    ${PublishedDescription_PB}    Test Desc     

 
Verify To Publish Solution In Company Marketplace     #Verify to publish the solution/model in company marketplace
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}                           
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}    
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Wait Until Element Is Visible    ${check_Image_loaded}     60s    
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Company}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToPublish_Company}    ${SearchModelName_Company}
     sleep    15s
     Click Element    ${check_Image_loaded}   
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${publishToCompanyMarketplaceTab}    60s    
     Click Element    ${publishToCompanyMarketplaceTab}
     sleep   15s
     ${status_modelDescComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${modelDescription_Completed_Company}
     Run Keyword If      "${status_modelDescComp}" == "PASS"     Click Element    ${modelDescriptionBtn_Company}
     Run Keyword If      "${status_modelDescComp}" == "PASS"     Input Text    ${modelDescription_text_Company}    Test Desc
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Wait Until Element Is Enabled        ${ModelDescription_DoneBtn_Company}    30s    
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Click Element    ${ModelDescription_DoneBtn_Company}
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Wait Until Element Is Visible     ${modelDescription_Completed_Company}     30s
     ${status_modelCategoryComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelCategory_Completed_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Wait Until Element Is Visible    ${ModelCategoryBtn_Company}     30s
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Click Element    ${ModelCategoryBtn_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectCategoryDrpdwn_Company}    30s
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${SelectCategoryDrpdwn_Company}
     #Run Keyword If      "${status_modelCategoryComp}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectModelCategory_PR_Company}    30s 
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${SelectModelCategory_PR_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitTypeDrpdwn_Company}   15s
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element     ${SelectToolkitTypeDrpdwn_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitType_H2O_Company}    30s 
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${SelectToolkitType_H2O_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Wait Until Element Is Enabled    ${ModelCategory_Done_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"   Click Element    ${ModelCategory_Done_Company}
     Run Keyword If      "${status_modelCategoryComp}" == "PASS"     Wait Until Element Is Visible     ${ModelCategory_Completed_Company}    30s
     Click Element    ${SkipModelDocumentsCheckbox_Company} 
     Wait Until Element Is Visible    ${SkipModel_DoneBtn_Company}  15s
     Click Element    ${SkipModel_DoneBtn_Company}  
     ${status_TagPresentComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelTag_Completed_Company}
     Run Keyword If      "${status_TagPresentComp}" == "PASS"   Wait Until Element Is Visible     ${ModelTag_Company}    30s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"    Click Element    ${ModelTagsBtn_company}    #added 
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Input Text   ${ModelTag_Company}   testComTag
     sleep  5s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Click Element    ${ModelTagsBtn_company}
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Wait Until Element Is Visible    ${ModelTag_Completed_Company}    30s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"    Click Element    ${ModelTagsBtn_company}    #added 
     Element Should Be Visible    ${TagPresent_Company}     
     ${status_ImageUploadedComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${UploadImage_Completed_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"   Click Element    ${UploadImageForModelBtn_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Wait Until Element Is Visible    ${UploadIcon_Go_Png_Company}     20s
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Click Element    ${UploadIcon_Go_Png_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    sleep  5s
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Click Element     ${UploadIcon_Done_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Wait Until Element Is Visible    ${UploadImage_Completed_Company}    20s  
     Wait Until Element Is Enabled    ${submitToPublicationBtn_Company}         10s    
     Click Element    ${submitToPublicationBtn_Company}
     Wait Until Element Is Visible    ${publishToCompanyMarketplaceCompleted}        10s     
     Element Should Be Visible    ${publishToCompanyMarketplaceCompleted}

Verify The Published Solution In Published To Company Marketplace    #Verify already published(in company) is displaying in My models in Published to Company Marketplace
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Click Element    ${searchModelTxtbox}    
     # Wait Until Element Is Visible    ${check_Image_loaded_COM}     60s
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Company} 
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${image_Published_Company}    ${SearchModelName_Company}
     
Verify the description available in published in Company marketplace model     
   Wait Until Keyword Succeeds  60   10    Wait Until Element Is Visible    ${check_Image_loaded_COM}     30s    #changed
   Click Element    ${check_Image_loaded_COM} 
   Wait Until Keyword Succeeds  60   5    Wait Until Element Is Visible    ${PublishedDescription_OR}    10s
   Element Should Contain    ${PublishedDescription_OR}    Test Desc            
 
Verify Delete Model In MyModels For Unpublished Model    #Verify to delete the solution/model in my models  
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}                            
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon} 
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Wait Until Element Is Visible    ${check_Image_loaded}     60s    
     Input Text    ${searchModelTxtbox}    ${DeleteModelName}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToDelete}    ${DeleteModelName}  
     Click Element    ${check_Image_loaded}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${DeleteModelTab}    60s    
     Click Element     ${DeleteModelTab}
     Wait Until Element Is Visible    ${DeleteButton_MyModels}    10s
     Click Element    ${DeleteButton_MyModels}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Input Text    ${searchModelTxtbox}    ${DeleteModelName}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${DeletedModel_InMyModels}    ${DeleteModelName}     

Verify Delete Model In MyModels For Published Model    
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon}                            
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon} 
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Wait Until Element Is Visible    ${check_Image_loaded_COM}     60s    
     Input Text    ${searchModelTxtbox}    ${Published_DeleteModelName}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToDelete_Published}    ${Published_DeleteModelName} 
     Click Element    ${check_Image_loaded_COM}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${DeleteModelTab}    60s   
     Click Element     ${DeleteModelTab}
     Wait Until Element Is Visible    ${DeleteButton_MyModels}    10s
     Click Element    ${DeleteButton_MyModels}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Input Text    ${searchModelTxtbox}    ${Published_DeleteModelName}
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${DeletedModel_InMyModels}    ${Published_DeleteModelName}

 Verify To Publish Already Published Public Model Into Company Marketplace 
    
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon} 
     Wait Until Element Is Visible    ${myModelIcon}    10s
     Click Element    ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Wait Until Element Is Visible    ${check_Image_loaded_PUB}     60s
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Public} 
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${image_Published_Public}    ${SearchModelName_Public}
     Wait Until Keyword Succeeds  60   5    Wait Until Element Is Visible    ${check_Image_loaded_PUB}     10s    #changed
     Click Element    ${check_Image_loaded_PUB}   
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
     Click Element       ${manageMyModelBtn}
     Wait Until Element Is Visible    ${publishToCompanyMarketplaceTab}    60s    
     Click Element    ${publishToCompanyMarketplaceTab}
     sleep   15s
     ${status_modelDescComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${modelDescription_Completed_Company}
     Run Keyword If      "${status_modelDescComp}" == "PASS"     Click Element    ${modelDescriptionBtn_Company}
     Run Keyword If      "${status_modelDescComp}" == "PASS"     Input Text    ${modelDescription_text_Company}    Test Desc
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Wait Until Element Is Enabled         ${ModelDescription_DoneBtn_Company}    15s
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Click Element    ${ModelDescription_DoneBtn_Company}
     Run Keyword If    "${status_modelDescComp}" == "PASS"    Wait Until Element Is Visible     ${modelDescription_Completed_Company}     15s
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
     Click Element    ${SkipModelDocumentsCheckbox_Company}
     Click Element    ${SkipModel_DoneBtn_Company}
     ${status_TagPresentComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelTag_Completed_Company}
     Run Keyword If      "${status_TagPresentComp}" == "PASS"   Wait Until Element Is Visible     ${ModelTag_Company}    10s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Click Element    ${ModelTagsBtn_company}    #added
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Input Text   ${ModelTag_Company}   testComTag
     sleep  5s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Click Element    ${ModelTagsBtn_company}
     Run Keyword If      "${status_TagPresentComp}" == "PASS"  Wait Until Element Is Visible    ${ModelTag_Completed_Company}    15s
     Run Keyword If      "${status_TagPresentComp}" == "PASS"    Click Element    ${ModelTagsBtn_company}   #added 
     Element Should Be Visible    ${TagPresent_Company}     
     ${status_ImageUploadedComp}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${UploadImage_Completed_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"   Click Element    ${UploadImageForModelBtn_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Wait Until Element Is Visible    ${UploadIcon_Go_Png_Company}     10s
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Click Element    ${UploadIcon_Go_Png_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    sleep  5s
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Click Element     ${UploadIcon_Done_Company}
     Run Keyword If      "${status_ImageUploadedComp}" == "PASS"    Wait Until Element Is Visible    ${UploadImage_Completed_Company}    15s
     Wait Until Element Is Enabled    ${submitToPublicationBtn_Company}         10s    
     Click Element    ${submitToPublicationBtn_Company}
     Wait Until Element Is Visible    ${publishToCompanyMarketplaceCompleted}        10s     
     Element Should Be Visible    ${publishToCompanyMarketplaceCompleted}

Verify Publishing already Published Company Model Into Public Marketplace     
     Wait Until Element Is Visible    ${homeIcon}    10s    
     Click Link        ${homeIcon} 
     Click Element        ${myModelIcon}
     Wait Until Element Is Visible    ${searchModelTxtbox}   60s
     Wait Until Element Is Visible    ${check_Image_loaded_COM}     60s
     Input Text    ${searchModelTxtbox}    ${SearchModelName_Public} 
     Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${image_Published_Company}    ${SearchModelName_Public}
     Wait Until Keyword Succeeds  60   5    Wait Until Element Is Visible    ${check_Image_loaded_COM}     10s
     Wait Until Element Is Visible    ${check_Image_loaded_COM}     60s
     Click Element    ${check_Image_loaded_COM}
     Wait Until Element Is Visible    ${manageMyModelBtn}    60s
     Reload Page
     Wait Until Element Is Enabled    ${manageMyModelBtn}    40s
     sleep    15s
     Click Element           ${manageMyModelBtn}
     Wait Until Element Is Visible    ${publishToPublicMarketplaceTab}    60s    
     Click Element    ${publishToPublicMarketplaceTab}
     sleep   5s
     ${status_modelDescPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${modelDescription_Completed_Public}
     Run Keyword If      "${status_modelDescPub}" == "PASS"     Click Element    ${modelDescriptionBtn_Public}
     Run Keyword If      "${status_modelDescPub}" == "PASS"     Input Text    ${modelDescription_text_Public}    Test Desc
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Wait Until Element Is enabled    ${ModelDescription_DoneBtn_Public}    15s   
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Click Element    ${ModelDescription_DoneBtn_Public}
     Run Keyword If    "${status_modelDescPub}" == "PASS"    Wait Until Element Is Visible     ${modelDescription_Completed_Public}     15s        
     ${status_modelCategoryPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelCategory_Completed_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Wait Until Element Is Visible    ${ModelCategoryBtn_Public}     10s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Click Element    ${ModelCategoryBtn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"    Execute JavaScript    window.scrollTo(0,100)
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectCategoryDrpdwn_Public}    10s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectCategoryDrpdwn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectModelCategory_PR_Public}    10s 
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectModelCategory_PR_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitTypeDrpdwn_Public}   5s
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element     ${SelectToolkitTypeDrpdwn_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Visible    ${SelectToolkitType_H2O_Public}    10s 
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${SelectToolkitType_H2O_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Wait Until Element Is Enabled    ${ModelCategory_Done_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"   Click Element    ${ModelCategory_Done_Public}
     Run Keyword If      "${status_modelCategoryPub}" == "PASS"     Wait Until Element Is Visible     ${ModelCategory_Completed_Public}    15s    
     Click Element    ${SkipModelDocumentsCheckbox_Public}
     Click Element    ${SkipModel_DoneBtn_Public}
     ${status_TagPresentPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${ModelTag_Completed_Public}
     Run Keyword If      "${status_TagPresentPub}" == "PASS"   Wait Until Element Is Visible     ${ModelTag_Public}    10s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Click Element    ${ModelTagsBtn_public}    #added
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Input Text   ${ModelTag_Public}   testPubTag
     sleep  5s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Click Element    ${ModelTagsBtn_public}
     Run Keyword If      "${status_TagPresentPub}" == "PASS"  Wait Until Element Is Visible    ${ModelTag_Completed_Public}    15s
     Run Keyword If      "${status_TagPresentPub}" == "PASS"    Click Element    ${ModelTagsBtn_public}    #added 
     Element Should Be Visible    ${TagPresent_Public}     
     ${status_ImageUploadedPub}  ${result}=    Run keyword and ignore error    Element Should Not Be Visible    ${UploadImage_Completed_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"   Click Element    ${UploadImageForModelBtn_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Wait Until Element Is Visible    ${UploadIcon_Go_Png_Public}     10s
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Click Element    ${UploadIcon_Go_Png_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    sleep  5s
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Click Element     ${UploadIcon_Done_Public}
     Run Keyword If      "${status_ImageUploadedPub}" == "PASS"    Wait Until Element Is Visible    ${UploadImage_Completed_Public}    15s
     Wait Until Element Is Enabled    ${submitToPublicationBtn_Public}         10s    
     Click Element    ${submitToPublicationBtn_Public}
     #added
     Wait Until Element Is Visible    ${WithdrawRequestBtn_Public}    20s
     Click Element    ${PublishRequestIcon}
     Wait Until Keyword Succeeds  60   10    Wait Until Element Is Not Visible    ${overlay}    10s
     # Execute JavaScript    window.scrollTo(0,400)
     # Wait Until Element Is Visible    ${showing_PublishReq_Drp}    10s
     # Execute JavaScript    window.scrollTo(0,400)
     # Click Element    ${showing_PublishReq_Drp}
     # Wait Until Element Is Visible    ${show_100_PublishReq}    5s
     sleep    5s
     # Execute JavaScript    window.scrollTo(0,400)
     # Click Element    ${showing_PublishReq_Drp}
     # Wait Until Element Is Visible    ${show_100_PublishReq}    5s
     # Click Element    ${show_100_PublishReq}
     # Wait Until Keyword Succeeds  60   10    Wait Until Element Is Not Visible    ${overlay}    10s         
     Wait Until Element Is Visible    ${search_PublishRequest}    10s
     Input Text    ${search_PublishRequest}    ${SearchModelName_Public}
     Wait Until Keyword Succeeds  60   10    Wait Until Element Contains    ${searchedModelNameForApproval}    ${SearchModelName_Public}    20s
     Click Element    ${approve_PublishRequest}
     Wait Until Element Is Visible    ${approveBtn}    10s
     Click Element    ${approveBtn}
     Wait Until Element Is Visible    ${requestorStatus}  
     Element Should Contain    ${requestorStatus}    Approved 
     #Wait Until Element Is Visible    ${publishToPublicMarketplaceCompleted}        10s    #removed     
     #Element Should Be Visible    ${publishToPublicMarketplaceCompleted}        #removed   
     
Verify complete model name display in the rate section on model description screen
    Wait Until Element Is Visible    ${homeIcon}    10s
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${marketPlaceIcon}    10s
    Click Link        ${marketPlaceIcon}
    Wait Until Element Is Visible    ${searchModelTxtbox}   60S
    Wait Until Element Is Visible    ${check_Image_loaded}     60S
    Input Text    ${searchModelTxtbox}    ${SearchModelName_Public}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}    ${SearchModelName_Public}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${descriptionTab}    60s
    Wait Until Element Is Enabled    ${descriptionTab}    30s
    Click Element    ${descriptionTab}
    Wait Until Element Is Visible    ${Rate_Section}    60s 
    Element Should Be Visible    ${Rate_Section}
    
         
    
Verify dashboard options in Site Admin    #Verify the dashboard options in the site admin tab 
    Wait Until Element Is Visible    ${siteAdminIcon}    10s
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${monitoring_tab}    20s
    Element Should Be Visible   ${monitoring_tab}   
    Wait Until Element Is Visible    ${user_Management_Tab}    20s
    Element Should Be Visible    ${user_Management_Tab}    
    Wait Until Element Is Visible    ${site_Configuration_Tab}    20s
    Element Should Be Visible    ${site_Configuration_Tab}    
    Wait Until Element Is Visible    ${federation_Tab}    20s
    Element Should Be Visible    ${federation_Tab}    
    Wait Until Element Is Visible    ${requests}    20s
    Element Should Be Visible    ${requests}    
    Wait Until Element Is Visible    ${configure_workflows}    20s
    Element Should Be Visible    ${configure_workflows}    

Verify Model Details page Tabs    #To verify Model details page tabs
	Wait Until Element Is Visible    ${myModelIcon}    10s
	Click Element    ${myModelIcon} 
	Wait Until Element Is Visible    ${searchModelTxtbox}   60s
	Click Element    ${searchModelTxtbox}
	#Wait Until Element Is Visible    ${check_Image_loaded}     60s    
	Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
	Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}     ${SearchModelName_MyModel}
	Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${descriptionTab}    25s
    Element Should Be Visible   ${descriptionTab}   
    Wait Until Element Is Visible    ${signaturesTab}    15s
    Element Should Be Visible    ${signaturesTab}    
    Wait Until Element Is Visible    ${documentsTab}    15s
    Element Should Be Visible    ${documentsTab}    
    Wait Until Element Is Visible    ${modelArtifactTab}    15s    
    Element Should Be Visible    ${modelArtifactTab}   

Verify Solution ID is displaying on Model Details page     #To verify Solution ID is displaying on Model details page 
	Wait Until Element Is Visible    ${myModelIcon}    10s
	Click Element    ${myModelIcon} 
	Wait Until Element Is Visible    ${searchModelTxtbox}   60s
	Wait Until Element Is Visible    ${check_Image_loaded}     60s    
	Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
	Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}     ${SearchModelName_MyModel}
	Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${solutionID_ModelDetails}    30s
    Element Should Be Visible   ${solutionID_ModelDetails}

Verify Solution ID is displaying on Manage My Model Page    #To verify Solution ID is displaying on Manage My Model page
    Wait Until Element Is Visible    ${myModelIcon}    10s
	Click Element    ${myModelIcon} 
	Wait Until Element Is Visible    ${searchModelTxtbox}   60s
	Wait Until Element Is Visible    ${check_Image_loaded}     60s    
	Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
	Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}     ${SearchModelName_MyModel}
	Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${manageMyModelBtn}    60s
    Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
    Click Element       ${manageMyModelBtn}
    Wait Until Element Is Visible    ${solutionID_MyModels}    40s
    Element Should Be Visible    ${solutionID_MyModels}    
        

Verify Manage My Model Management Options
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon}
    Wait Until Element Is Visible    ${searchModelTxtbox}   60s
    Wait Until Element Is Visible    ${check_Image_loaded}     60s    
    Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}    ${SearchModelName_MyModel}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${manageMyModelBtn}    60s
    Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
    Click Element       ${manageMyModelBtn}
    Wait Until Element Is Visible    ${onboradingTab_ManageMyModel}    60s    
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
    Wait Until Element Is Visible    ${searchModelTxtbox}   60s
    Wait Until Element Is Visible    ${check_Image_loaded}     60s    
    Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}     ${SearchModelName_MyModel}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${status_Unpublished}    15s
    Element Should Be Visible    ${status_Unpublished}        

Verify the Status of Deleted solution in Model details page
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon} 
    Input Text    ${searchModelTxtbox}    ${DeleteModelName}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${DeletedModel_InMyModels}    ${DeleteModelName}
    Click Element    ${Check_Image_Loaded_Deleted}
    Wait Until Element Is Visible    ${status_Deleted}    15s
    Element Should Be Visible    ${status_Deleted} 

Verify that Manage My Model Button for Deleted solution is disabled
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon}   
    Input Text    ${searchModelTxtbox}    ${DeleteModelName}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${DeletedModel_InMyModels}    ${DeleteModelName}
    Click Element    ${Check_Image_Loaded_Deleted}
    Wait Until Element Is Visible    ${manageMyModel_Btn_ForDeletedModel}    20s
    
                                                         
Verify Navigation to Account Settings Page
    Wait Until Element Is Visible    ${homeIcon}    10s    
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${accountInfo_Dropdown}    10s
    Click Element    ${accountInfo_Dropdown}
    Wait Until Element Is Visible    ${accountSetting_link}    10s
    Click Link    ${accountSetting_link}
    Wait Until Element Is Visible    ${accountSetting_PageTitle}    40s   
    Element Should Be Visible    ${accountSetting_PageTitle}           

     
Verify Adding Author Tab Is Present In Manage My Models Page
    Wait Until Element Is Visible    ${myModelIcon}    10s
    Click Element    ${myModelIcon} 
    Wait Until Element Is Visible    ${searchModelTxtbox}   60s
    Wait Until Element Is Visible    ${check_Image_loaded}     60s    
    Input Text    ${searchModelTxtbox}    ${SearchModelName_MyModel}
    Wait Until Keyword Succeeds  60   5  Element Text Should Be     ${imageToVerify}     ${SearchModelName_MyModel}
    Click Element    ${check_Image_loaded}
    Wait Until Element Is Visible    ${manageMyModelBtn}    60s
    Wait Until Element Is Enabled    ${manageMyModelBtn}    30s
    Click Element       ${manageMyModelBtn}
    Wait Until Element Is Visible    ${manageAuthors}    40s
    Element Should Be Visible     ${manageAuthors}    

Verify Adding New Author In Manage My Models Page    
    Click Element    ${manageAuthors}
    Wait Until Element Is Visible    ${authorName}
    Input Text    ${authorName}     Test
    Input Text    ${authorContactInfo}    Test
    Wait Until Element Is Enabled    ${addAuthorBtn}    15s
    Click Element    ${addAuthorBtn}
    Wait Until Element Is Visible    ${authorCreated}    15s            
    
Verify adding new user in User Management and User Activation
    Wait Until Element Is Visible    ${homeIcon}    10s    
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${siteAdminIcon}         15s
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${user_Management_Tab}    15s
    Click Element    ${user_Management_Tab}
    Wait Until Element Is Visible    ${add_NewUser_Btn}
    Click Element    ${add_NewUser_Btn}
    ${addUser_Data} =   Get Current Date    result_format=%d_%m_%Y_%H_%M_%S
    Set Suite Variable    ${addUser_Data}  
    Wait Until Element Is Visible    ${fname_AddUser}    10s
    Input Text    ${fname_AddUser}    ${addUser_Data}
    Wait Until Element Is Visible    ${lname_AddUser}    10s
    Input Text    ${lname_AddUser}    ${addUser_Data}
    Wait Until Element Is Visible    ${userName_AddUser}    10s
    Input Text    ${userName_AddUser}    ${addUser_Data}
    Wait Until Element Is Visible    ${email_AddUser}    10s
    Input Text    ${email_AddUser}    ${addUser_Data}@test.com
    Wait Until Element Is Visible    ${password_AddUser}    10s
    Input Text    ${password_AddUser}    Test@1234user
    Wait Until Element Is Visible    ${confirmPass_AddUser}     10s
    Input Text    ${confirmPass_AddUser}    Test@1234user
    Wait Until Element Is Visible    ${role_AddUser_DrpDwn}    10s
    Click Element    ${role_AddUser_DrpDwn}
    Wait Until Element Is Visible    ${select_MLP_SystemUser}     10s
    Click Element    ${select_MLP_SystemUser}
    Click Element    ${role_AddUser_DrpDwn}
    Wait Until Element Is Enabled      ${addBtn_AddUser}    10s
    Click Element    ${addBtn_AddUser}
    Wait Until Element Is Visible    ${searchUser_UserManagement}    15s
    Input Text    ${searchUser_UserManagement}    ${addUser_Data}@test.com
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_uname}    ${addUser_Data}
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_email}    ${addUser_Data}@test.com
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_role_MLPSysUser}    MLP System User
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_status}    Pending
    Click Element    ${AddedUser_FirstChkBox}
    Click Element    ${bulkActionsDrpDwn}
    Wait Until Element Is Visible    ${bulkAction_ActiveUserOption}    5s
    Click Element    ${bulkAction_ActiveUserOption}
    Click Element    ${UserMgmt_ApplyBtn}
    Wait Until Element Is Visible    ${confirmBtn_ActiveUserPopup}    15s
    Click Element    ${confirmBtn_ActiveUserPopup}
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_status}    Active

Verify that Manage Themes Displays Show Your Interests popup 
    Wait Until Element Is Visible    ${homeIcon}    10s    
    Click Link        ${homeIcon}
    Wait Until Element Is Visible    ${accountInfo_Dropdown}    10s
    Click Element    ${accountInfo_Dropdown}
    Wait Until Element Is Visible    ${manageThemes_link}   10s
    Click Link    ${manageThemes_link}
    Wait Until Element Is Visible    ${interests_popup}    40s   
    Element Should Be Visible    ${interests_popup}

Verify the user is able to select the theme title in Show Your Interests Popup
    Wait Until Element Is Visible    ${selectTag}    15s
    Click Element    ${selectTag}
    Wait Until Element Is Visible    ${tagSelectedTrue}    15s
    Element Should Be Visible    ${tagSelectedTrue}        
    #${status_interestPopup}  ${result}=    Run keyword and ignore error    Wait Until Element Is Visible      ${interestPopup_closeBtn}    30s
    #Run Keyword If      "${status_interestPopup}" == "PASS"     Click Element    ${interestPopup_closeBtn}          
    
Verify Continue and Back button on Show Your Interests Popup   
    Wait until element is visible     ${continueBtn_InterestsPopup}  10s
    Click Element    ${continueBtn_InterestsPopup} 
    Wait until element is visible    ${BackBtn_InterestsPopup}    10s
    Click element    ${BackBtn_InterestsPopup}
    Wait Until Element Is Visible    ${interestPopup_closeBtn}    15s
    Click Element    ${interestPopup_closeBtn}
        

Verify Logout    #Verify logout functionality          
     Wait Until Element Is Visible    ${signOut}      10s        
     Click Element        ${signOut}    
     Wait Until Keyword Succeeds     60     5    Wait Until Element Is Visible    ${signInLink}   30s
     Wait Until Keyword Succeeds     60     5    Element Should Be Visible    ${signInLink}    30s    #CHANGED
         
Verify Add User By Login With Newly Added User
    Open Browser    ${URL}   ${BROWSER}       ff_profile_dir=${FF_PROFILE}
    sleep  3s
    ${addedUser}=     Get Variable Value           ${addUser_Data}
    Set Suite Variable    ${addedUser}         #added       
    #Click Link        ${homeLink}
    Wait Until Element Is Visible    ${signInLink}     20s
    Click Element        ${signInLink}
    #sleep  15s
    Wait Until Element Is Visible    ${loginEmailAddressEntry}   25s   
    Input Text    ${loginEmailAddressEntry}      ${addedUser} 
    #sleep  15s 
    Wait Until Element Is Visible    ${loginPassword}    25s
    Input Text    ${loginPassword}    Test@1234user
    Click Button    ${signInButton}
    Wait Until Element Is Visible    ${loginAccountInfo}    25s
    Element Should Be Visible    ${loginAccountInfo}  
    #Close Browser
    
Verify Change Password On Account Setting Page
    ${status_interestPopup}  ${result}=    Run keyword and ignore error    Wait Until Element Is Visible      ${interestPopup_closeBtn}    30s
    Sleep    3s
    Run Keyword If      "${status_interestPopup}" == "PASS"     Click Element    ${interestPopup_closeBtn}    
    ${CP_User}=     Get Variable Value           ${addedUser}
     Wait Until Element Is Visible    ${accountInfo_Dropdown}    15s
     Click Element    ${accountInfo_Dropdown}
     Wait Until Element Is Visible    ${accountSetting_link}    10s
     Click Link    ${accountSetting_link}
     Wait Until Element Is Visible    ${changePasswordLink}    20s
     Click Element    ${changePasswordLink}
     Wait Until Element Is Visible    ${CP_OldPassword}    20s
     Input Text    ${CP_OldPassword}    Test@1234user
     Wait Until Element Is Visible    ${CP_NewPassword}    20s
     Input Text    ${CP_NewPassword}    NewSignUPTest@123
     Wait Until Element Is Visible    ${CP_ConfirmPassword}    20s
     Input Text    ${CP_ConfirmPassword}    NewSignUPTest@123
     Wait Until Element Is Enabled    ${CP_ConfirmBtn}    25s
     Click Element    ${CP_ConfirmBtn}
     Wait Until Keyword Succeeds  45   5    Wait Until Element Is Visible    ${signInLink}    30s
     Click link        ${signInLink}
     Wait Until Element Is Visible    ${loginEmailAddressEntry}   25s
     Input Text    ${loginEmailAddressEntry}      ${CP_User} 
     Wait Until Element Is Visible    ${loginPassword}    25s
     Input Text    ${loginPassword}    NewSignUPTest@123
     Wait Until Element Is Visible    ${signInButton}    30s
     Click Button    ${signInButton}
     Wait Until Element Is Visible    ${loginAccountInfo}    25s
     Element Should Be Visible    ${loginAccountInfo}    
    

To Verify SignUp Functionality
    Open Browser    ${URL}   ${BROWSER}       ff_profile_dir=${FF_PROFILE}
    sleep  3s
    ${signUp_Data} =   Get Current Date    result_format=%d_%m_%Y_%H_%M_%S
    Set Suite Variable    ${signUp_Data}
    Wait Until Element Is Visible    ${signUpLink}    15s    
    Click Element    ${signUpLink}
    Wait Until Element Is Visible    ${firstNameInputbox}    15s
    Input Text    ${firstNameInputbox}    ${signUp_Data}
    Wait Until Element Is Visible    ${lastNameInputbox}    15s
    Input Text    ${lastNameInputbox}    ${signUp_Data}
    Wait Until Element Is Visible    ${signUpUserName}    15s
    Input Text    ${signUpUserName}    ${signUp_Data}
    Wait Until Element Is Visible    ${signUpEmailId}    15s
    Input Text    ${signUpEmailId}    ${signUp_Data}@test.com
    Wait Until Element Is Visible    ${signUpPassword}      15s
    Input Text    ${signUpPassword}     SignUpTest@1234
    Wait Until Element Is Visible    ${signUpConfirmPassword}      15s
    Input Text    ${signUpConfirmPassword}     SignUpTest@1234
    Click Element    //div[@class='signup-txt-mob']/label[contains(text(),'Already')]
    Wait Until Element Is Enabled    ${signUpBtn}    20s
    Click Element    ${signUpBtn}
    sleep    15s
    Wait Until Element Is Visible    ${signInLink}     20s
    Click Element        ${signInLink}
    Wait Until Element Is Visible    ${loginEmailAddressEntry}   25s   
    Input Text    ${loginEmailAddressEntry}    ${username} 
    Wait Until Element Is Visible    ${loginPassword}    25s
    Input Text    ${loginPassword}    ${password}
    Click Button    ${signInButton}   
    Wait Until Element Is Visible    ${siteAdminIcon}         25s
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${user_Management_Tab}    15s
    Click Element    ${user_Management_Tab}
    Wait Until Element Is Visible    ${searchUser_UserManagement}    15s
    Input Text    ${searchUser_UserManagement}    ${signUp_Data}@test.com
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_uname}    ${signUp_Data}
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_email}    ${signUp_Data}@test.com
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_role_MLPSysUser}    MLP System User
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_status}    Pending
    Click Element    ${AddedUser_FirstChkBox}
    Click Element    ${bulkActionsDrpDwn}
    Wait Until Element Is Visible    ${bulkAction_ActiveUserOption}    5s
    Click Element    ${bulkAction_ActiveUserOption}
    Click Element    ${UserMgmt_ApplyBtn}
    Wait Until Element Is Visible    ${confirmBtn_ActiveUserPopup}    15s
    Click Element    ${confirmBtn_ActiveUserPopup}
    Wait Until Keyword Succeeds  45   5  Element Text Should Be    ${registeredAddUser_status}    Active
    Wait Until Element Is Visible    ${signOut}      10s        
    Click Element        ${signOut}    
    Wait Until Keyword Succeeds     60     5    Wait Until Element Is Visible    ${signInLink}   30s
    Wait Until Keyword Succeeds     60     5    Element Should Be Visible    ${signInLink}
    sleep    5s
    Click link        ${signInLink}
    Wait Until Element Is Visible    ${loginEmailAddressEntry}   60s       
    Input Text    ${loginEmailAddressEntry}      ${signUp_Data}@test.com 
    Wait Until Element Is Visible    ${loginPassword}    25s
    Input Text    ${loginPassword}    SignUpTest@1234
    Click Button    ${signInButton}
    Wait Until Element Is Visible    ${loginAccountInfo}    25s
    Element Should Be Visible    ${loginAccountInfo}  

Verify Login With Invalid Username and Password
    Open Browser    ${URL}   ${BROWSER}       ff_profile_dir=${FF_PROFILE}
    Wait Until Element Is Visible    ${signInLink}     15s
    Click Element        ${signInLink}
    Wait Until Element Is Visible    ${loginEmailAddressEntry}   25s   
    Input Text    ${loginEmailAddressEntry}    InvalidUserTest     
    Wait Until Element Is Visible    ${loginPassword}    25s
    Input Text    ${loginPassword}    InvalidPasswordTest
    Click Button    ${signInButton}
    Wait Until Element Is Visible    ${loginUserNotExistError}   20s
    Close Browser                           

Verify SignUp for Invalid Inputs for Username and Email
    Open Browser    ${URL}   ${BROWSER}       ff_profile_dir=${FF_PROFILE}
    sleep  3s
    Wait Until Element Is Visible    ${signUpLink}    20s    
    Click Element    ${signUpLink}
    Wait Until Element Is Visible    ${firstNameInputbox}    15s
    Input Text    ${firstNameInputbox}    TestFN
    Wait Until Element Is Visible    ${lastNameInputbox}    15s
    Input Text    ${lastNameInputbox}    TestLN
    Wait Until Element Is Visible    ${signUpUserName}    15s
    Click Element    ${signUpUserName}  
    Wait Until Element Is Visible    ${signUpEmailId}    15s
    Input Text    ${signUpEmailId}    testEmail
    Wait Until Element Is Visible    ${signUpPassword}      15s
    Click Element    ${signUpPassword}
    Wait Until Element Is Visible    ${usernameError}    15s    
    Wait Until Element Is Visible    ${emailError}    15s
    Close Browser        
                       
 Tear Down   #Close all browsers
  [Documentation]   Close all browsers
   Close All Browsers
   
    

