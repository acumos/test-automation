*** Variables ***
#Locators
${marketplaceLink}  //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/marketPlace']    
${modelerResorcesLink}  //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/modelerResource']            
${signIn}  //button[@ng-click='signin()']
${homeLink}             //header-nav[@class='mdl-layout__header is-casting-shadow']//a[@href='#/home']  #//div/sidebar-nav/nav[@class='mdl-navigation cg-sidebar Acu-desktop-sidebar']//a[1]/span[2]      
${addYourModelBtn}     //main[@class='mdl-layout__content initialVal ']//section//button[@alt='ADD YOUR MODEL NOW']    
${exploreMarketPlaceBtn}        //main[@class='mdl-layout__content initialVal ']//section//button/a[contains(text(),'EXPLORE MARKETPLACE')]    
${signInLink}            //header-nav[@class='mdl-layout__header is-casting-shadow']//ul[@ng-show='successfulLoginSigninSignup']//a[@class='no-outline' and contains(text(),'Sign In')]    
${loginEmailAddressEntry}     //input[@name='userName']
${loginPassword}        //input[@name='userPass']
${signInButton}         //button[@ng-click='signin()']
${loginAccountInfo}    //*[@id='account-info']
${myModelIcon}        //a[@title='My Models']
${OnboardingModelIcon}     (//span[contains(.,'ON-BOARDING MODEL')])[1]  
${OnboardingModelTitle}    //span[@class='headline mob-disblock'][contains(.,'On-Boarding Model')]


${Page_1_Btn}  //button[@class='mdl-button mdl-js-button btn-secondary count-btn selected-btn'][contains(.,'1')]
${Page_2_Btn}  //button[@class='mdl-button mdl-js-button btn-secondary count-btn selected-btn'][contains(.,'2')]
${Page_3_Btn}  //button[@class='mdl-button mdl-js-button btn-secondary count-btn'][contains(.,'3')]
${Page_4_Btn}  //button[@class='mdl-button mdl-js-button btn-secondary count-btn'][contains(.,'4')]
${Page_5_Btn}  //button[@class='mdl-button mdl-js-button btn-secondary count-btn'][contains(.,'5')]
${ellipsisBtn}  (//button[@class='mdl-button mdl-js-button btn-secondary count-btn'][contains(.,'...')])[2]
${nextBtn}  //button[@class='mdl-button mdl-js-button btn-secondary'][contains(.,'Next')]
${PreviousBtn}  //button[@class='mdl-button mdl-js-button btn-secondary'][contains(.,'Previous')]

${signOut}           //a[@ng-click='logout()']/span[@class='icon-logout']        
${acumos_logo_without_login}     //header-nav[@class='mdl-layout__header is-casting-shadow']//span[@class='accumos-header-logo']/img[@title='Acumos']     
${homeIcon}            //nav[@class='mdl-navigation cg-sidebar Acu-desktop-sidebar']//a[@ui-sref='home']    
${designStudioIcon}   //a[@title='Design Studio']
${designStudioTitle}  //span[@class='headline mob-disblock' and contains(text(),'Design Studio')] 
${modelComposer}  //span[contains(.,'Model Composer')] 
${acuCompose}  //span[contains(.,'Acu-compose')]         
${marketPlaceIcon}     //a[@title='Marketplace']
${myModelPageTitle}    //section[@class='pageheadsection mob-pageheadsection1']/div/div/span    
${siteAdminIcon}       //a[@title='Site Admin']
${siteAdminPageTitle}  //section//div/span[contains(text(),'Site Admin')]
${publishRequestIcon}   //a[@title='Publish Request']
${publishRequestPageTitle}   //section//div/span[contains(text(),'Publish Request')]
${Model_Name}              //th[@role='button'][1]
${Version}                //th[@role='button'][2]
${Requester}             //th[@role='button'][3]
${Created_Date}                //th[@role='button'][4]
${Status}                    //th[@role='button'][5]
${Request_Status}            //th[@role='button'][6]
${Comments}                    //th[@role='button'][7]
${Model_Name_AscDesc}                //span[contains(@ng-if,'orderByField!="solutionName"')]
${Version_AscDesc}                    //span[contains(@ng-if,'orderByField!="revisionName"')]
${Requester_AscDesc}                    //span[contains(@ng-if,'orderByField!="requestorName"')]
${Created_Date_AscDesc}           //span[@ng-if='orderByField!="creationDate"']
${Status_AscDesc}                //span[contains(@ng-if,'orderByField!="revisionStatusName"')]
${Request_Status_AscDesc}        //span[contains(@ng-if,'orderByField!="requestStatusName"')]
${Comments_AscDesc}                    //span[contains(@ng-if,'orderByField!="modified"')]
${View_Link}  (//a[@ng-click='setActiveComment(publishReq.publishRequestId)'][contains(.,'View')])[1]
${PublisherComments_Popup}  //div[@class='custom_popover']//h2[contains(text(),"Publisher's Comments")]
${Approved_Text}  //div[@class='custom_popover']//p[contains(text(),'Approved')]
${Hide_Link}  //a[contains(text(),'Hide')]

${deleteApiToken}    //a[@ng-click='deleteApiToken()'][contains(.,'Delete Token')]
${API_tokenTextarea}  //input[contains(@ng-model,'user.apiToken')]
${Refresh_Token}  //a[@ng-click='refreshApiToken()'][contains(.,'Refresh')]

${notification_link}     //button[@class='mdl-button header-ddl mdl-js-button cg-acitve md-button md-ink-ripple'][contains(.,'notifications_none')]
${readAllMessages}  //button[contains(@ng-click,'showNotification()')]
${manage_notifications_title}  //span[contains(.,'Manage Notifications')]
${selectAll_checkbox}  //input[contains(@ng-model,'selectAll')]
${subject_link}    //th[@role='button'][contains(.,'Subject')]


# Error Model
${Delete_icon}    //div/manage-module/div/div/div[2]/div/div[3]/div[1]/div[1]/div/div[3]/div[2]/i
${Error_DetailsPopup}    //div[@id='errorModelPopup']/md-dialog/md-toolbar/div/h2
${closePoup_OK}    //div[@id='errorModelPopup']/md-dialog/md-dialog-actions/div/div/button
${Delete_ModelPopup}    //div[@id='confirmPopupDeleteModel']/md-dialog/md-toolbar/div/h2
${Delete_ModelConfirmButton}   //div[@id='confirmPopupDeleteModel']/md-dialog/md-dialog-actions/div/button[2] 
${Error_Foundlink}    (//div[contains(@class,'grid-error-msg')])[2]   

${image_Published_Error}   //div[2]/div/label/span[@class='griditem-title-text2']    
${DeleteBtn}   //div/div[@class='popupdeleteicon']/i[@ng-click='openDeleteConfirmPopup(privateSolution)']
${check_Err_Image_loaded}   (//img[contains(@ng-click,'onClickModel(privateSolution.solutionId, privateSolution.ownerId, privateSolution.latestRevisionId)')])[2]
${imageToVerify_Err}    //div/manage-module/div/div/div[2]/div/div[3]/div[1]/div[1]/div[4]/div[1]/div[2]/div/label/span
# ${check_Image_loaded_PUB}  //div/div[2]/div/div[3]/div[@class='grid-container']//div[@class='grid-top-section']/div/figure/img[1]
${Rate_Section}   //h6[contains(@class,'sectiontitle9 rate-title')]
${imageToVerify_PUB}  //div/div/div/div[@class='mpdetailscontainer']/label[@class='griditem-title']

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
${ModelTag_Public}     //div[@id='public-market']//tags-input//div[@class='tags']/input    
${ModelTagsBtn_public}    //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Model Tags')]    
${ModelTag_Completed_Public}    //div[@id='public-market']//span[@ng-if='!tags1.length<1' and contains(text(),'Completed')]
${TagPresent_Public}    //*[@id='public-market']//ul[@class='tag-list']/li[1]  
${UploadImageForModelBtn_Public}     //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Upload')]
${UploadIcon_Go_Png_Public}    //div[@id='public-market']//div[@class='iconcontainer']/img[@ng-src='images/solutions/go.png']
${UploadIcon_Done_Public}    //*[@id='public-market']//button[contains(@ng-click,'updateSolImage')]/span[contains(text(),'Done')] 
${UploadImage_Completed_Public}    //div[@id='public-market']//span[@ng-show='showSolutionImage' and contains(text(),'Completed')]  

${Approverequest_popup}    //h2[contains(@ng-show,"requestApprovalModal == 'approve'")]
${Approverequest_Text}    //textarea[contains(@ng-model,'descriptionPop')]             
#//body/div[10]//md-option[@ng-repeat='category in allCategory' and @value='DT']/div[2]
#//md-option[@ng-repeat='category in allCategory' and @value='DT']/div[2] 
#//div[text()='Classification']//ancestor::div[contains(@class,'md-active md-clickable')]//div[text()='Prediction']
${submitToPublicationBtn_Public}           //button[contains(text(),'Submit to Publication') and contains(@ng-click,'PB')]   
${publishToPublicMarketplaceCompleted}    //a[@title='Publish to Public Marketplace']//div/ul[@class='green']/li[contains(text(),'Completed')]
${marketPlacePageTitle}    //span[@class='headline mob-disblock' and contains(text(),'Marketplace')]    
${onBoardingByWebPageTitle}     //span[@class='headline mob-disblock' and contains(text(),'On-Boarding Model')]    
${searchModelTxtbox}   //input[contains(@ng-model,'searchBox')]  # //input[contains(@id,'module-search')]  #//*[@id='module-search']    # .//*[@id='Authors']/div[2]/ng-form/div[2]/button[contains(@alt,'Add author')]    # //div/div/div[2]/div[1]/input[@id='module-search']
${filter_prediction}   //md-checkbox[@value='{"code":"PR","name":"Prediction"}']//div[@class='md-container md-ink-ripple']
${filter_classification}    //md-checkbox[@value='{"code":"CL","name":"Classification"}']//div[@class='md-container md-ink-ripple']
${filter_DataSources}  //md-checkbox[@value='{"code":"DS","name":"Data Sources"}']//div[@class='md-container md-ink-ripple']
${filter_regression}     //md-checkbox[@value='{"code":"RG","name":"Regression"}']//div[@class='md-container md-ink-ripple']  
${filter_dataTransformer}    //md-checkbox[@value='{"code":"DT","name":"Data Transformer"}']//div[@class='md-container md-ink-ripple']
${check_Image_loaded}      (//img[contains(@ng-click,'onClickModel(privateSolution.solutionId, privateSolution.ownerId, privateSolution.latestRevisionId)')])[1]  #//div/div[@class='grid-outer-wrapper']/div/div/div/div/div[@class='product-image']/figure/img[2]  # (//img[contains(@class,'img-rounded')])[1]   #//div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img[@class='img-rounded']     
${check_Image_loaded_DELa}  (//img[@ng-click='onClickModel(deletedSolution.solutionId, deletedSolution.ownerId,deletedSolution.latestRevisionId)'])[1]
${check_Image_loaded_COM}  (//img[contains(@ng-show,'companySolution.picture')])[1]
${check_Image_loaded_PUB}   //div[@ng-if='hidePublic']/div[1]/div[1]/div[1]/div[@class='grid-top-section']/div/figure[1]/img[@class='img-rounded']
${check_Image_loaded_PUBa}   (//img[contains(@ng-click,'onClickModel($index, mlsolution.solutionId, mlsolution.latestRevisionId)')])[1]
${check_Image_loaded_COMa}  (//img[@ng-click='onClickModel(companySolution.solutionId, companySolution.ownerId,companySolution.latestRevisionId)'])[1]


# ${check_Image_pub_loaded}    //div/manage-module/div/div/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[1]/div[1]/figure/img[2]  #//div/manage-module/div/div/div[2]/div/div[3]/div[3]/div/div[1]/div/div[1]/div[@class='product-image']/figure/img[1]
${imageToPublish_Company}    //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[1]/div[1]/div/div[1]/div[2]/div/label/span  #//div[@class='grid-outer-wrapper']/div[@class='grid-container' And @ng-if='hideCompany']/div[@ng-show='Viewtile']/div/div/div[@class='mpdetailscontainer']/div/label/span[1]           
${imageToPublish_Public}     //div/manage-module/div/div/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div/label/span
# ${publishingImage_Pub}    //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[1]/div[1]/div/div[1]/div[1]/figure/img[2]    #//div/div[@class='mp-grid']/div/div/div[@ class='product-image']/figure/img[@ng-src='images/default-model.png']  #//div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img[@class='img-rounded']   //div[@class='grid-outer-wrapper']/div[@class='grid-container' And @ng-if='hidePrivate']/div[1]/div/div[1]/div[2]/div[@class='tilecontainer1']/label/span     //div/div[@class='mp-grid']/div/div/div[@ class='product-image']/figure/img[@ng-src='images/default-model.png']       
${imageToDelete}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span
${imageToVerify}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span 
${imageToVerify_P}    (//label[contains(@class,'griditem-title')])[1]          
${manageMyModelBtn}          //button[contains(@href,'modelEdit')]    
${publishToPublicMarketplaceTab}    //*[@id='manage-models']/div/div/section/div/div/div[2]/div/ul/li[5]/a[@title='Publish to Public Marketplace']     # //a[contains(@ng-click,'Publish to Public Marketplace')]
${SolutionPublishedSuccessfulMsg}   //span[contains(text(),'Solution Published Successfully')
#Company
${publishToCompanyMarketplaceTab}    //a[contains(@ng-click,'Publish to Company Marketplace')]    
${ModelDescriptionBtn_Company}    //div[contains(@ng-show,'company')]//h2/a[contains(text(),'Description')]    
${ModelDescription_text_Company}    //div[contains(@ng-show,'company')]//div[@data-placeholder='Insert text here ...']
${ModelDescription_DoneBtn_Company}      //*[@id='company-market']//button[contains(@ng-click,'updateCompanyDescription')]
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
${SkipModel_DoneBtn_Company}      //button[contains(@ng-click,'skipStep();company.close = true;')]  #.//*[@class='popovers skippopover']/md-dialog-content/div/div[2]/button[@ng-click='skipStep();company.close = true;']  #//*[@id='company-market']//button[contains(@ng-click,'skipStep();company.close = true')]
${ModelTag_Company}     //div[@id='company-market']//tags-input//div[@class='tags']/input    
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
${DeleteButton_MyModels}     //*[@id='manage-models']//button[@title='Delete']
${DeleteButton_Confirm_Popup}  //h2[contains(text(),'Delete Model')] 
${DeleteButton_Confirm}   //button[contains(@ng-click,'deleteSolutions()')]  
${DeletedModel_InMyModels}  //span[contains(@class,'griditem-title-text2')] 
#Site Admin Dashboard
${monitoring_tab}    //a[@ng-click='menuName = "Monitoring"']
${user_Management_Tab}  //a[@ng-click='menuName = "User Management"']   # html/body/div[3]/div/main/div/admin/div/div[1]/div/div/div[1]/div/a[@ng-click='menuName = "User Management"']    
${site_Configuration_Tab}    //a[@ng-click='menuName = "Site Configuration"']
${federation_Tab}    //a[@ng-click='menuName = "Federation"']
${requests}    //a[@ng-click='menuName = "Requests"']
${configure_workflows}    //a[@ng-click='menuName = "Validation"']                        
#My Model :Model details tab
${descriptionTab}        //a[@title='Description']
${signaturesTab}         //a[@title='Signatures']
${signaturesTitle}  //h6[@class='sectiontitle6'][contains(.,'SIGNATURE')]
${documentsTab}          //a[@title='Documents']
${modelArtifactTab}        //a[@title='Model Artifacts']              
#Manage My Model Management Options
${onboradingTab_ManageMyModel}     //a[contains(@ng-click,'On-Boarding')]
${shareWithTeamTab}    //a[contains(@title,'Share with Team')]
${shareWithTeam_title}  //span[contains(text(),'Share With Team')]
${findauser_tosharewith}  //md-input-container[contains(.,'Find a user to Share with')]
${Demo_name}  //span[contains(.,'Acumos Admin')]
${findauser_tosharewith_tab}  //input[contains(@placeholder,'Find a user to share with')]
${Share_Button}  //button[@ng-click='shareWithMultiple();'][contains(.,'Share')]
${Demo_image}  (//img[@alt='Acumos Admin'])[4]
${sharedModelName}  (//div[contains(.,'Acumos Admin')])[19]
${SharedWithOthers_Icon}  (//span[contains(@title,'Shared With Others')])[1]

${Export_DeployToCloud}    //a[contains(@ng-click,'Export/Deploy to Cloud')]
${viewDownloadsTab}    //a[contains(@ng-click,'View Downloads')]
${replyToCommentsTab}    //a[contains(@ng-click,'Reply to Comments')]
${manageAuthors}       //*[@id='manage-models']/div/div/section/div/div/div[2]/div/ul/li[3]/a[@title='Manage Authors']     # //a[contains(@ng-click,'Manage Authors')]    
#Descover Acumos links
${discover_Marketplace}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/a/div[@class='discover-description']/h5[contains(text(),'Marketplace')]
${discover_DesignStudio}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/a/div[@class='discover-description']/h5[contains(text(),'Design Studio')]
${discover_SDN_ONAP}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'SDN & ONAP')]
${discover_TeamUp}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'Team Up!')]
${discover_Onborading}    //main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'Onboard with your Preferred Toolkit')]
#Check Published Model(Public) in My Model
${check_Image_loaded_PUB}   //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[3]/div/div[1]/div/div[1]/div[1]/figure/img[1]  #//div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img[@class='img-rounded']
${image_Published_Public}    //div[@ng-if='hidePublic']/div[1]/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]
#Check Published Model(Company) in My Model
${check_Image_loaded_COM}  //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[2]/div[1]/div/div[1]/div[1]/figure/img[1]   #(//img[contains(@class,'img-rounded')])[1]  #//div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div/figure/img[@class='img-rounded']    
${image_Published_Company}   //div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]
#Navigation to Account Settings Page
${accountInfo_Dropdown}        //*[@id='account-info']
${accountSetting_link}        //a[contains(text(),'Account Settings')]
${accountSetting_PageTitle}   //section[@class='pageheadsection']//span[contains(text(),'Account Settings')]
# html/body/div[3]/div/main/div/user-detail/div[1]/section/div/div/span[@class='headline mob-disblock']   html/body/div[3]/div/main/div/user-detail/div[1]/section/div/div/span[contains(text(),'Account Settings')]    # 
#Status of Unpublished solution
${status_Unpublished}    //span[contains(text(),'Status: Unpublished')] 
#Overlay Page Loader 
${overlay}    //div[@class='a-overlay1']
${Category_link}  //h6[@class='sectiontitle9'][contains(.,'CATEGORY')]
#UserManagement_AddUser 
${add_NewUser_Btn}    //button[@ng-click='showPopup()']      
${fname_AddUser}        //*[@ng-model='value.fname']
${lname_AddUser}        //*[@ng-model='value.lname']
${userName_AddUser}        //*[@ng-model='value.username']
${email_AddUser}        //*[@id='emailValue']
${password_AddUser}        //*[@id='password']
${confirmPass_AddUser}        //*[@ng-model='value.cpassword']
${role_AddUser_DrpDwn}      //md-select[contains(@ng-model,'roleValue')]  #//*[@ng-model='roleValue']  #//md-select-value[@id='select_value_label_143']//span[@class='md-select-icon']  #//*[@ng-model='roleValue']
${role_AddUser_DrpDwnA}  //md-backdrop[contains(@class,'md-select-backdrop md-click-catcher')]

# ${select_Admin}   //*[@id="select_option_106"]
${AddnewUser_Popup}  //h2[contains(text(),'Add New User')]
${DntSndPw}  //div[@class='admin-row admin-row1']//div//div[@class='md-container md-ink-ripple']
# ${CloseAddNewUser_Popup}  (//button[contains(@ng-click,'closePoup()')])[31]
# ${Cancel_Popup}  (//button[@ng-click='closePoup()'][contains(.,'Cancel')])[12]
${select_MLP_SystemUser}    (//md-option[contains(@ng-repeat,'role in allRoles')])[4]  #//div[text()='MLP System User']//ancestor::div[contains(@class,"md-active")]//following-sibling::div[text()='MLP System User']/preceding-sibling::div[@class='md-container']//div[@class='md-icon']
${addBtn_AddUser}        //md-dialog[@role='dialog']//button[contains(text(),'Add')]    
${searchUser_UserManagement}    //*[contains(concat(' ', @class, ' '), 'user-mgmt-search-container')]//input[@ng-model='search']
${registeredAddUser_uname}    //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]//td[2]    #changed
${registeredAddUser_email}    //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]//td[3]    #changed
${registeredAddUser_role_MLPSysUser}    //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]/tr/td[4]/div[1]    #changed
${registeredAddUser_status}       //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]/tr/td[5]/label    #changed
${AddedUser_FirstChkBox}        //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]/tr/td[1]/label/input    #added       
${bulkActionsDrpDwn}        //div[@class='admin-container-row1-inner3']//div[@class='note-btn-container']/md-select[@placeholder='Bulk Actions']    #added
${bulkAction_ActiveUserOption}    //md-option[@role='option']/div[contains(text(),'Active User')]    #added    
${UserMgmt_ApplyBtn}        //div[@class='admin-container-row1-inner3']/button[contains(text(),'Apply')]    #added
${confirmBtn_ActiveUserPopup}    //*[@id='confirmPopup']/md-dialog/md-dialog-actions//button[@ng-click='addRoleFunc(confirmFuncMsg)']    #added        
#Delete Published Model
${imageToDelete_Published}    //div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]                                 
#SignUp Functionality
${signUpLink}    //header-nav[@class='mdl-layout__header is-casting-shadow']//ul[@ng-show='successfulLoginSigninSignup' and @aria-hidden='false']//a[contains(text(),'Sign Up')]    #changed
${firstNameInputbox}    //input[@name='firstName']
${lastNameInputbox}    //input[@name='lastName']
${signUpUserName}    //input[@name='username']
${signUpEmailId}     //input[@name='uemail']
${signUpPassword}        //input[@name='pwd']
${signUpConfirmPassword}        //input[@name='cpwd']
${signUpBtn}    //button[contains(text(),'Sign up')]
#Change Password On Account Settings Page
${changePasswordLink}    //a[@title='Change Password']
${CP_OldPassword}    //input[@name='oldPswd']
${CP_NewPassword}    //input[@name='pwd' and @ng-model='newPswd']
${CP_ConfirmPassword}    //input[@name='cpwd' and @ng-model='cpwd']
${CP_ConfirmBtn}    //button[@alt='Confirm']                    
#Invalid Username And Password Login Scenario
${usernamePasswordError}    //span[@ng-show='userPassInvalid']
${loginUserNotExistError}    //*[@id='dialogContent_sign-in-dialog']//div[@ng-show='userIdDisabled']/span[contains(text(),'Your account is deactivated or does not exist')]    #changed         
#Verify SignUp for Invalid Inputs for Username and Email
${usernameError}    //span[@ng-show='!!signupForm.username.$error.required && signupForm.username.$touched && usernameVisited']
${emailError}    //span[@ng-show='!!(signupForm.uemail.$dirty && signupForm.uemail.$error.pattern) && emailVisited']    
#Verify Solution id is present on Model details page
${solutionID_ModelDetails}    //*[@id='md-model-detail-template']//span[@class='solution_id_bg']
#Verify Solution id is present on My Models page
${solutionID_MyModels}        //*[@id='manage-models']/section[@class='pageheadsection gray-bg']//span[@class='solution_id_bg']    
#Create Author in Manage My Models
${authorName}    //input[@ng-model='Author.Name']
${authorContactInfo}    //input[@ng-model='Author.cntinfo']
${addAuthorBtn}         //button[@title='Add author']
${authorCreated}    //div[@id='Authors']/tags-input/div/div[@class='tags']/ul/li[1]
#Status of Deleted solution
${status_Deleted}    //span[contains(text(),'Status: Deleted')]
${Check_Image_Loaded_Deleted}         //div[@ng-repeat='deletedSolution in mlSolutionDelete'][1]/div[1]/div[1]/figure/img[@class='img-rounded']
#Manage My Model button in Deleted Model
${manageMyModel_Btn_ForDeletedModel}    //button[@ng-disabled='editModel' and @disabled='disabled']
#Publish Request for publishing 
${WithdrawRequestBtn_Public}    //*[@id='public-market']//button[contains(text(),'Withdraw Request')]    
${PublishRequestIcon}        //span[@class='headertxtspan' and contains(text(),'Publish Request')]
${search_PublishRequest}    //input[@ng-model='searchPublishRequest']
${approve_PublishRequest}    //div[@class='admin-action-container']/button[1][@name='approvePublishRequestModal']
${approveRequestPopup_Description}    //textarea[@ng-model='descriptionPop']
${approveBtn}        //div[@id='publishRequestModal']//button/span[contains(text(),'Approve')]
${searchedModelNameForApproval}    //publish-request//tbody/tr[1]/td/a/label[@class='model-name']
${requestorStatus}        //div/publish-request/div[2]/div/div[2]/table/tbody/tr[1]/td[6]/label 
${showing_PublishReq_Drp}       //div[@class='select-control']
${show_100_PublishReq}        //div[@class='select-control']//option[@ng-value='100']
#Manage Themes and interests popup
${manageThemes_link}    //a[@role='menuitem' and contains(text(),'Manage Themes')]      
${interests_popup}        //*[@id='myDialogTags']//h2[contains(text(),'What are your interests?')]
${selectTag}           //div[@class='theme-tile-wrapper']/div[2]/div[1]/md-checkbox[1]/div[1]  #(//div[contains(@class,'md-container md-ink-ripple')])[8]  #//div[@class='md-dialog-content']//div[@class='theme-tile-wrapper']/div[@class='theme-tile'][1]/div[@class='theme-check-container']/md-checkbox[1]/div/div[@class='md-icon']   #//div[@class='md-dialog-content']//div[@class='theme-tile-wrapper']/div[@class='theme-tile'][1]/div[@class='theme-check-container']/md-checkbox[1]/div/div[@class='md-icon']  #//*[@id='menu_container_4']/md-menu-content/md-menu-item[3]/a[contains(text(),'Manage Themes')] 
${tagSelectedTrue}        //div[@class='theme-progress-container2']/div[@class='theme-tile-wrapper']/div[2]/div[1]/md-checkbox[1]/div[1]  #//div[@class='md-dialog-content']//div[@class='theme-tile-wrapper']/div[@class='theme-tile'][1]/div[@class='theme-check-container']/md-checkbox[@aria-checked='true']        
# ${tagSelectedTrue_2}  (//div[contains(@class,'md-container md-ink-ripple')])[2]
${interestPopup_closeBtn}    //*[@id='myDialogTags']//button[@ng-disabled='disabledFlag']/i[@class='material-icons' and contains(text(),'close')]
${continueBtn_InterestsPopup}    //*[@id='myDialogTags']/md-dialog/form/md-dialog-actions/div/div[2]/button[@title='Continue']     # //button[@title='Continue']
${BackBtn_InterestsPopup}        //button[@ng-click='back()']
#Description in Published to public marketplace Model
${PublishedDescription_PB}     //div[@ng-show='showPBDescription']/p
#Description in Published to Company marketplace Model
${PublishedDescription_OR}    //div[@ng-show='showORDescription']/p[1]






