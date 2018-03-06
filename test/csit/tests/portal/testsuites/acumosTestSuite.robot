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
Launch Firefox
  Setup Firefox Browser
Header Validation
   Verify header
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
Logout Portal
  Verify Logout
Tear Down browser
  Tear Down
  
   
*** Keywords ***
Setup Firefox Browser
   Open Browser    ${URL}   ${BROWSER}        
   Sleep    5s 
     
 Verify header
    Element Should Be Visible    ${homeLink}  
    Element Should Be Visible    ${marketplaceLink}   
    Element Should Be Visible    ${modelerResorcesLink}
       
 Verify Explore Marketplace Button
     #Sleep     20s
     #Click Button    ${homeLink}
     Wait Until Element Is Visible    ${exploreMarketPlaceBtn}      10s    
     Click Element    ${exploreMarketPlaceBtn}
     Wait Until Element Is Visible  ${marketPlacePageTitle}    10s
     Element Should Be Visible    ${marketPlacePageTitle} 
       
Verify Add Your Model Button
    Click Link        ${homeLink}
    Wait Until Element Is Visible    ${addYourModelBtn}      10s     
    Click Button   ${addYourModelBtn}
    Wait Until Element Is Visible    ${onBoardingByWebPageTitle}     60s
    Element Should Be Visible    ${onBoardingByWebPageTitle}  

Verify Login
    Click Link        ${homeLink}
    Wait Until Element Is Visible    ${signInLink}     15s
    Click Element        ${signInLink}
    sleep  15s  
    Input Text    ${loginEmailAddressEntry}    ${username} 
    sleep  15s 
    Input Text    ${loginPassword}    ${password}
    Click Button    ${signInButton}
    Wait Until Element Is Visible    ${loginAccountInfo}    10s
    Element Should Be Visible    ${loginAccountInfo}   
  
 Verify Marketplace Tab
   #Wait Until Element Is Visible    ${marketPlaceIcon}
   Click Element    ${marketPlaceIcon}
   Wait Until Element Is Visible    ${marketPlacePageTitle}  10s
   Element Should Be Visible    ${marketPlacePageTitle}
            
Verify My Models Tab           
   Click Element    ${myModelIcon}
   Wait Until Element Is Visible     ${myModelPageTitle}  10s
   Element Should Contain    ${myModelPageTitle}     My Models 

                
 Verify Design Studio Tab
    Click Element    ${designStudioIcon}
    Wait Until Element Is Visible    ${designStudioTitle}   10s
    Element Should Be Visible    ${designStudioTitle}        
 

Verify Site Admin Tab 
    Click Element    ${siteAdminIcon}
    Wait Until Element Is Visible    ${siteAdminPageTitle}   10s
    Element Should Be Visible    ${siteAdminPageTitle}
             
 Verify Logout
     Click Element        ${singOut}
     Wait Until Element Is Visible    ${signInLink}     10s
     Element Should Be Visible    ${signInLink}
               
 Tear Down
   Sleep    15s    
  [Documentation]   Close all browsers
   Close All Browsers
