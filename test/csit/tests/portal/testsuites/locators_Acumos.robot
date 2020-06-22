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
${myModelPageTitle}    //span[@class='headline mob-disblock']    
${siteAdminIcon}       //a[@title='Site Admin']
${siteAdminPageTitle}  //section//div/span[contains(text(),'Site Admin')]
${publishRequestIcon}   //a[@title='Publish Request']
${publishRequestPageTitle}   //section//div/span[contains(text(),'Publish Request')]
${Model_Name}              //th[@class='sorting_asc'][contains(.,'Model Name')]
${Version}                (//th[@class='sorting'])[1]
${Requester}             (//th[@class='sorting'])[2]
${Created_Date}                (//th[@class='sorting'])[3]
${Catalog}                    (//th[@class='sorting'])[4]
${Access_Level_PR}    (//th[@class='sorting'])[5]
${Request_Status}            (//th[contains(@class,'sorting')])[7]
${Comments}                    (//th[contains(@class,'sorting')])[8]
# ${Model_Name_AscDesc}                //span[contains(@ng-if,'orderByField!="solutionName"')]
# ${Version_AscDesc}                    //span[contains(@ng-if,'orderByField!="revisionName"')]
# ${Requester_AscDesc}                    //span[contains(@ng-if,'orderByField!="requestorName"')]
# ${Created_Date_AscDesc}           //span[@ng-if='orderByField!="creationDate"']
# ${Catalog_AscDesc}                //publish-request[1]/div[2]/div[1]/div[2]/table[1]/thead[1]/tr[1]/th[5]/span[1]
# ${Access_Level}    //th[@ng-click="orderByField='accessType'; reverseSortPbReq = !reverseSortPbReq"]
# ${Access_Level_AscDesc}    //publish-request[1]/div[2]/div[1]/div[2]/table[1]/thead[1]/tr[1]/th[6]/span[1]
# ${Request_Status_AscDesc}        //span[contains(@ng-if,'orderByField!="requestStatusName"')]
# ${Comments_AscDesc}                    //span[contains(@ng-if,'orderByField!="modified"')]
${View_Link}  (//a[@ng-click='setActiveComment(publishReq.publishRequestId)'][contains(.,'View')])[1]
${PublisherComments_Popup}  //div[@class='custom_popover']//h2[contains(text(),"Publisher's Comments")]
${Approved_Text}  (//p[contains(text(),'')])[2]
${Hide_Link}  //a[contains(text(),'Hide')]
${MaintainedBackupLogs}    (//a[@href='#tab9-panel']//span)[4]

#role mgmt
${roleMgmtTab}    (//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect'])[2]
${roleMgmtTitle}    //span[contains(text(),'Role Management')]
${roleName}   (//th[@role='button'])[5]
${ModulePermission}    //th[@ng-click="orderByField='moduleList'; reverseSortRole = !reverseSortRole"]
${roleMgmtAction}    (//th[contains(.,'Action')])[1]
${roleNameSorting}    //div/admin//div[2]/table/thead/tr/th[1]/span
${ModulePermissionSorting}    (//span[@class='gridcell-sort deactivate'])[5]
${createNewRole}    //button[text()[normalize-space()='Create New Role']]
${createNewRole_Popup}    //md-dialog/md-toolbar/div/h2[contains(.,'Create New Role')]
${Role_Name_TextBox}    //input[@ng-model='roleName']    
${select_Cat_Perm}    (//md-checkbox[contains(@class,'catalog-item ng-pristine')]//div)[1]
${createNewRole_Button}    //button[@ng-disabled='!selectedCatalogList.length || !roleName ']
${SearchByRole}    (//input[contains(@class,'mdl-textfield__input adminsearchicon')])[3]
${New_Role}    //td[text()='Testing_Role']
${Edit_Role}    (//span[@class='gridicon-edit'])[1]
${updateNewRole_Button}    //button[@ng-disabled='!selectedCatalogList.length || !roleName ']
${Delete_Role}    (//button[@class='mdl-button mdl-button--icon'])[2]
${Delete_Role_Popup}    (//h2[text()='Delete Confirmation'])[3]
${Delete_Role_Confirm}    (//md-dialog-actions/div/button[contains(.,'Confirm')])[12]
${No_Results_Found}    (//strong[text()[normalize-space()='No Results Found']])[1]

${deleteApiToken}    //a[@ng-click='deleteApiToken()'][contains(.,'Delete Token')]
${API_tokenTextarea}  //input[contains(@ng-model,'user.apiToken')]
${Refresh_Token}  //a[@ng-click='refreshApiToken()'][contains(.,'Refresh')]
${1stName}    //input[@ng-blur='firstNameVisited=true']    
${2ndName}    //input[@ng-blur='lastNameVisited=true']    
${UpdateAccount}    //button[@alt='Update Account']

${notification_link}     //button[@class='mdl-button header-ddl mdl-js-button cg-acitve md-button md-ink-ripple'][contains(.,'notifications_none')]
${readAllMessages}  //button[contains(@ng-click,'showNotification()')]
${manage_notifications_title}  //span[contains(.,'Manage Notifications')]
${selectAll_checkbox}  //input[contains(@ng-model,'selectAll')]
${subject_link}    //th[@class='sorting'][contains(.,'Subject')]

${subscription_col}    //th[contains(text(),'Subscriptions')]
${subscription_col_num}    //div//div[@id='tab5-panel']//tbody//tr[1]//td[4]//label[1]
${view/add_link}    (//a[contains(.,'View/Add')])[1]
${view/add_link_popup}    (//h2[contains(text,'')])[41]
${subsciptions_id}   (//table[@class='mdl-data-table mdl-js-data-table mdl-shadow--2dp tbl-notification-list']/thead/tr/th[2])[1]
${created_on}    //th[contains(text(),'Created on')]
${catalog_name1}    //th[contains(text(),'CATALOG NAME')]
#${updated_on}    //th[contains(text(),'Updated on')]
${frequency_of_update}    //th[contains(text(),'Frequency of update')]
${federation_Tab_title}    //span[@class='admin-title2'][contains(text(),'Federation')]
${View/add_doneBtn}    //form[@class='ng-valid ng-dirty ng-valid-parse']//div//button[@class='mdl-button mdl-js-button btn-primary'][contains(text(),'Done')]
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

${ModelDescriptionBtn_Public}    //div[1]/model-edit[1]/div[2]//section[1]//div[3]//article[2]/div[1]/div[2]/h2[1]/a[1]
${ModelDescription_text_Public}     //md-dialog-content[1]/div[1]/div[1]/ng-quill-editor[1]/div[2]/div[@data-placeholder='Insert text here ...']   #//div[@class='ql-editor ql-blank']//p  #//div[1]/model-edit[1]//section[1] //article[2]//ng-quill-editor[1]/div[2]/div[1]    #//div[contains(@ng-show,'public')]//div[@data-placeholder='Insert text here ...']
${ModelDescription_Completed_Public}   (//model-edit[1]//article[2]/div[1]/div[2]/h2[1]/span[1])[2]
${ModelDescription_DoneBtn_Public}        (//div[@class='popovers-cloud-modalfooter layout-row']//button[2])[3]   #//div[@class='popovers model-description']//button[@title='Done']           
${ModelCategoryBtn_Public}      //div//h2/a[contains(text(),'Model Category')]
${SelectCategoryDrpdwn_Public}    //div[@ng-show='showSolCat']//md-select[@ng-model='categoryname']
${SelectModelCategory_PR_Public}        //div[text()='Classification']//ancestor::div[contains(@class,'md-active md-clickable')]//div[text()='Prediction']   
${SelectToolkitTypeDrpdwn_Public}  //div[contains(@class,'category-popover')]//md-select[@ng-model='toolkitname'] 
${SelectToolkitType_H2O_Public}    //md-select-menu[@class='_md md-overflow']//md-option[@value='H2']
${ModelCategory_Done_Public}     //span[@ng-show='(!solution.modelTypeName && !solution.tookitTypeName )']
${ModelCategory_Completed_Public}    //div[1]/model-edit[1]/div[2]/div[1]/div[1]/section[1]/div[1]/div[1]/div[3]/div[4]/div[4]/div[1]/div[1]/article[3]/div[1]/div[2]/h2[1]/span[1]
${ModelDocumentsBtn_Public}      //div[contains(@ng-show,'public')]//h2/a[contains(text(),'Documents')]
${SkipModelDocumentsCheckbox_Public}    //input[@type='checkbox']   #//div[@ng-if='!showSolutionDocs']//input -->Company
${SkipModel_DoneBtn_Public}        (//div[@class='popovers-cloud-modalfooter layout-row']//button[2])[7]
${ModelTagsBtn_public_Input}     //input[contains(@placeholder,'Enter a tag')]  #//div[@id='public-market']//tags-input//div[@class='tags']/input    
${ModelTagsBtn_public}    //a[contains(text(),'Model Tags')]  #//div[contains(@ng-show,'public')]//h2/a[contains(text(),'Model Tags')]    
${ModelTag_Completed_Public}    (//model-edit[1]/div[2]/div[1]/div[1]/section[1]//div[1]/article[5]/div[1]/div[2]/h2[1]/span[1])[2]
${TagPresent_Public}    //span[@ng-bind='$getDisplayText()']  
${UploadImageForModelBtn_Public}     //a[@ng-click="showImageUpload = !showImageUpload; closeOtherPopovers( 'showImageUpload', showImageUpload )"]
${UploadIcon_Java_Png_Public}    (//img[@class='ng-pristine ng-untouched ng-valid ng-empty'])[5]  #//img[@class='ng-pristine ng-valid ng-empty ng-touched']
${UploadIcon_Done_Public}    //div[@class='popovers-cloud-modalfooter fullwidth layout-row']//button[@title='Done']
${UploadImage_Completed_Public}    //model-edit[1]/div[2]/div[1]/div[1]/section[1]//div[1]/article[6]/div[1]/div[2]/h2[1]/span[1]

${Approverequest_popup}    //h2[contains(@ng-show,"requestApprovalModal == 'approve'")]
${Approverequest_Text}    //textarea[contains(@ng-model,'descriptionPop')]             
#//body/div[10]//md-option[@ng-repeat='category in allCategory' and @value='DT']/div[2]
#//md-option[@ng-repeat='category in allCategory' and @value='DT']/div[2] 
#//div[text()='Classification']//ancestor::div[contains(@class,'md-active md-clickable')]//div[text()='Prediction']
${submitToPublicationBtn_Public}    //button[@alt='Submit to Publication']  #//button[contains(text(),'Submit to Publication') and contains(@ng-click,'PB')]   
${publishToPublicMarketplaceCompleted}    //a[@title='Publish to Public Marketplace']//div/ul[@class='green']/li[contains(text(),'Completed')]
${marketPlacePageTitle}    //span[@class='headline mob-disblock' and contains(text(),'Marketplace')]    
${onBoardingByWebPageTitle}     //span[@class='headline mob-disblock' and contains(text(),'On-Boarding Model')]    
${searchModelTxtbox}   //input[contains(@ng-model,'searchBox')]  # //input[contains(@id,'module-search')]  #//*[@id='module-search']    # .//*[@id='Authors']/div[2]/ng-form/div[2]/button[contains(@alt,'Add author')]    # //div/div/div[2]/div[1]/input[@id='module-search']
${filter_prediction}   //md-checkbox[@value='{"code":"PR","name":"Prediction"}']//div[@class='md-container md-ink-ripple']
${filter_classification}    //md-checkbox[@value='{"code":"CL","name":"Classification"}']//div[@class='md-container md-ink-ripple']
${filter_DataSources}  //md-checkbox[@value='{"code":"DS","name":"Data Sources"}']//div[@class='md-container md-ink-ripple']
${filter_regression}     //md-checkbox[@value='{"code":"RG","name":"Regression"}']//div[@class='md-container md-ink-ripple']  
${filter_dataTransformer}    //md-checkbox[@value='{"code":"DT","name":"Data Transformer"}']//div[@class='md-container md-ink-ripple']
${check_Image_loaded}      //div[@class='product-image']//img[@class='img-rounded']  #(//img[contains(@ng-click,'onClickModel(privateSolution.solutionId, privateSolution.ownerId, privateSolution.latestRevisionId)')])[1]  #//div/div[@class='grid-outer-wrapper']/div/div/div/div/div[@class='product-image']/figure/img[2]  # (//img[contains(@class,'img-rounded')])[1]   #//div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img[@class='img-rounded']     
${check_Image_loaded_DELa}  (//img[@ng-click='onClickModel(deletedSolution.solutionId, deletedSolution.ownerId,deletedSolution.latestRevisionId)'])[1]
${check_Image_loaded_COM}  (//img[contains(@ng-show,'companySolution.picture')])[1]
${check_Image_loaded_PUB}   //div[@class='product-image']//img[@class='img-rounded']
${check_Image_loaded_PUBa}   (//img[contains(@ng-click,'onClickModel($index, mlsolution.solutionId, mlsolution.latestRevisionId)')])[1]
${check_Image_loaded_COMa}  (//img[@ng-click='onClickModel(companySolution.solutionId, companySolution.ownerId,companySolution.latestRevisionId)'])[1]
${imageToUnPublish}    //span[@class='griditem-title-text2']
${check_Image_loaded_UN}    //div[@class='product-image']//img[@class='img-rounded']
${imageToUnPublishA}    (//label[contains(@class,'griditem-title')])[1]
${Add_Author_Error}    //div[contains(@class,'c-error')]
${Ok_Button}    //mdl-button[@ng-click='checkMessageButton()'][contains(.,'Ok')]

# ${check_Image_pub_loaded}    //div/manage-module/div/div/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[1]/div[1]/figure/img[2]  #//div/manage-module/div/div/div[2]/div/div[3]/div[3]/div/div[1]/div/div[1]/div[@class='product-image']/figure/img[1]
${imageToPublish_Company}    //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[1]/div[1]/div/div[1]/div[2]/div/label/span  #//div[@class='grid-outer-wrapper']/div[@class='grid-container' And @ng-if='hideCompany']/div[@ng-show='Viewtile']/div/div/div[@class='mpdetailscontainer']/div/label/span[1]           
${imageToPublish_Public}     //div/manage-module/div/div/div[2]/div/div[3]/div[1]/div[1]/div[1]/div[1]/div[2]/div/label/span
${imageToPublish_License}    //manage-module[1]/div[1]/div[1]//div[2]/div[1]/label[1]/span[1]
# ${publishingImage_Pub}    //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[1]/div[1]/div/div[1]/div[1]/figure/img[2]    #//div/div[@class='mp-grid']/div/div/div[@ class='product-image']/figure/img[@ng-src='images/default-model.png']  #//div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img[@class='img-rounded']   //div[@class='grid-outer-wrapper']/div[@class='grid-container' And @ng-if='hidePrivate']/div[1]/div/div[1]/div[2]/div[@class='tilecontainer1']/label/span     //div/div[@class='mp-grid']/div/div/div[@ class='product-image']/figure/img[@ng-src='images/default-model.png']       
${imageToDelete}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span
${imageToVerify}    //div[@class='grid-outer-wrapper']/div[1]/div[@ng-show='Viewtile']/div[1]//div[@class='mpdetailscontainer']/div[@class='tilecontainer1']/label/span 
${imageToVerify_P}    (//label[contains(@class,'griditem-title')])[1]          
${manageMyModelBtn}          //button[contains(@href,'modelEdit')]    
${publishToMarketplaceTab}    //a[@title='Publish to Marketplace']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']     # //a[contains(@ng-click,'Publish to Public Marketplace')]
${SolutionPublishedSuccessfulMsg}   //span[contains(text(),'Solution Published Successfully')

${selectCatalog}    //label[contains(text(),'Select Catalog')]
${selectCatalog_Dropdown}    (//span[contains(@class,'md-select-icon')])[1]
${Catalog_Ist_TEST}    //md-select-menu/md-content//div[contains(text(),'CATALOG_IST_TEST (Public)')]
${Catalog_Ist_TEST_A}    //div[@class='md-text'][contains(.,'CATALOG_IST_TEST (Public)')]
${Model_Publish_Confirm}    //h2[contains(text(),'Model Publish Confirmation')]
${Model_Publish_Confirm_OK}    //button[contains(@ng-click,'publishtoMarket')]
${stepstoSubmit}    //body/div[@class='mdl-layout__container'] //div[@class='timeline']/h6[1]
${ModelName_Completed}    (//body//div[@class='timeline-centered']//article[1]//div[1]//div[2]//h2[1]//span[1])[2]
${modelDescription_NotCompleted_Public}    (//body//div[@class='mdl-layout__container']//div//article[2]//div[1]//div[2]//h2[1]//span[1])[2]
${selectCatalog_publishedModel}    //label[contains(text(),'Catalog(s) of published model')]
${selectCatalog_publishedModel_dropdown}    //md-select[@ng-change='changeExistingCatalog();']
${UnpublishButton}    //div[@class='pull-right']//button[@title='Unpublish']
${UnpublishButton_PopUp}    //h2[contains(text(),'Model Unpublish Confirmation')]
${UnpublishButton_Confirm}    (//button[contains(.,'Confirm')])[6]   
${SV_Status_Popup}    //h2[contains(text(),'Security Verification Status')]
${StatusPendingImage}    //img[@title='failed']
${SV_Close_Popup}    (//md-dialog/md-toolbar/div/button)[7]

${All_Catalogs}    (//md-select-value//span[@class='md-select-icon'])[1]
${Select_Favorite_Catalogs_Tab}    //button[@title='Select Favorite Catalogs']
${All_Catalogs_tab}    //md-option//div[@class='md-text'][contains(text(),'All Catalogs')]
${My_Fav_Catalogs_tab}    //md-option//div[@class='md-text'][contains(text(),'My Favorite Catalogs')]


#catalog
${catalogIcon}    (//span[contains(text(),'Catalogs')])[1]
${catalogIconTitle}    //span[@class='headline mob-disblock']    
${Catalog_Name}    //th[@class='sorting_asc'][contains(.,'CATALOG NAME')]
${Publisher_Name}    //th[@class='sorting'][contains(.,'PUBLISHER NAME')]
${CreatedDate_Catalog}    //th[@class='sorting'][contains(.,'CREATED DATE')]
${AccessType_Catalog}    //th[contains(.,'ACCESS TYPE')]
${Total_Models}    //th[contains(.,'TOTAL MODELS')]
${Action_Catalog}    //th[@class='sorting_disabled'][contains(.,'ACTION')]
${AddNew_Catalog}    //button[contains(@title,'Add New Catalog')]
${AddNew_Catalog_PopUp}    //h2[contains(text(),'Add New Catalog')]
${CatalogName_Text}    //input[contains(@name,'catalogName')]    
${Accesslevel_Dropdown}    //md-dialog[1]/form[1]/md-dialog-content[1]//div[1]/md-select[1]
# ${Accesslevel_Public}    //div[@class='md-text'][contains(.,'Public')]
${Accesslevel_Public1}    (//div[@class='md-text'][contains(.,'Public')])[2]
${AddDescription_Text}    //textarea[contains(@ng-model,'parent.catalog.description')]
${Self_Publish}    //div[@class='md-container md-ink-ripple']
${AddCatalog_Button}    //button[@ng_click='parent.createCatalog()']
${searchCatalogTxtbox}    //input[contains(@placeholder,'Filter')]
${CatalogName_Link}    //a[@ng-click='showViewDetailsPopup(this,catalog)']
${ViewCatalog_PopUp}    //h2[contains(text(),'View Catalog')]
${CatalogName_Name}    //label[@class='catalog-title-heading']
${CatalogName_Link_OK}    //span[contains(.,'Ok')]
${Catalog_Tile}    //div[@class='grid-top-section']//span[@class='icon-header tile_icon-catalogs']
${EditCatalog}    //span[@class='gridicon-edit']
${Accesslevel_Public}    //div[@class='md-text'][contains(.,'Public')]
${Accesslevel_Restricted}  //div[@class='md-text'][contains(.,'Restricted')] 
${Favorite}    //th[@class='sorting_disabled'][contains(.,'Favorite')]
${CatalogName_FavPage}    //th[@class='sorting'][contains(.,'Catalog Name')]
${Catalog_CreatedDate}    //th[@class='sorting'][contains(.,'Created Date')]
${Catalog_TotalModels}    //th[@class='sorting_desc'][contains(.,'Total Models')]
${ViewFavCatalogs}    //span[contains(.,'View Favorite Catalogs')]
${ViewAllCatalogs}    //span[contains(.,'View All Catalogs')]

#manage peer  
${ManagePeer}    //span[contains(@class,'gridicon-access')] 
${GrantPeerAccess}    //button[contains(@ng-click,'grantAccessDialog()')]
${GrantPeerAccess_Popup}    //h2[contains(text(),'Grant Peers Access')]
${Cancel_PeerAccess}    //span[contains(.,'Cancel')]
${Peer_Name}    (//th[@role='button'])[4]
${FDQN}    (//th[@role='button'])[5]
${Email_Peer}    (//th[text()[normalize-space()='Email']])[2]
${Checkbox_peerAccess}    (//div[contains(@class,'md-container md-ink-ripple')])[4]
${Grant_Access}    //md-dialog-actions/div/button[2]/span
${Checkbox_1}    //div[@class='md-padding']//div//tbody//div[@class='md-container md-ink-ripple']
${GrantPeer_RemoveBtn}    //manage-peer/div[1]//div[1]/div[2]/button[contains(.,'Remove')]
${Remove_Confirmation}    //button[@alt='Delete']
${Action_1}    //span[@class='fas fa-times']    
${Confirmation_popup}    //h2[text()='Confirmation']    
${Confirm_Remove}    //button[@alt='Delete']

${UpdateCatalog_Button}    //button[@title='Update Catalog']
${DeleteCatalog}    (//span[contains(@class,'gridicon-delete')])[1]
${DeleteCatalog_Pop-up}    //h2[contains(text(),'Delete Confirmation')]
${DeleteCatalog_Pop-up_Confirm}    //button[@alt='Delete']
${SelectFavorite_Catalogs}    (//span[contains(text(),'Select Favorite Catalogs')])[1]
${SelectCatalogs_SearchBox}    //input[@placeholder='Filter']
${MY PUBLIC MODELS_IST2}    //label[contains(text(),'MY PUBLIC MODELS-IST2')]
${SelectedModel_Catalog}    //label[contains(text(),'TESTING_CATALOG')]
${FavoriteCatalog_Symbol}    //i[contains(.,'favorite_border')]
${Close_catalog}    //md-dialog[@class='ud-deactivate-account _md md-content-overflow md-transition-in']//i[@class='material-icons'][contains(text(),'close')]
${ModelName_catalog}    //div[@class='catalogSolutionAlignment']//div
${FavoriteCatalog_Checkbox}    //div[@class='md-container']
${Previous_Catalog}    //a[contains(@class,'paginate_button previous disabled')]
${Next_Catalog}    //a[contains(@class,'paginate_button next disabled')]

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
${SiteContent_Tab}      //a[@class='mdl-tabs__tab is-active']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
${RTU_Configuration_Tab}    //a[@ng-click='menuName = "RTU Configuration"']  #//a[@class='mdl-tabs__tab is-active']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
                     
#My Model :Model details tab
${descriptionTab}        //a[@title='Description']
${signaturesTab}         //a[@title='Signatures']
${signaturesTitle}  //h6[@class='sectiontitle6'][contains(.,'SIGNATURE')]
${documentsTab}          //a[@title='Documents']
${modelArtifactTab}        //a[@title='Model Artifacts']              
${LicenseTab}    //span[contains(text(),'License')]
${Author/publisherDetailsTab}    //a[@title='Author/Publisher Details']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
${managePublishers/Authors}
${addedAuthor}
${addedAuthor_RemoveBTN}
${DeleteAuthor_Popup}
${DeleteAuthor_Popup_Confirm}
${AuthorSectionTitle}
${manageAuthorsPageTitle}
${PublisherSection}

#Manage My Model Management Options
${onboardingTab_ManageMyModel}     //a[contains(@ng-click,'On-Boarding')]
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
${manageAuthors}       //*[@id='manage-models']/div/div/section/div/div/div[2]/div/ul/li[3]/a[@title='Manage Authors'] 
${publisherName_Authors}    //input[@name='publisherName']
${SaveBtn}    //span[contains(.,'Save')]

#on-boarding history tab verification
${OnboardingHistoryTab}	  //button[@ui-sref='onboardingHistory']
${OnboardingHistoryTab_title}	//span[@class='headline mob-disblock'][contains(.,'View On-Boarding History')]
${Model_Name_OB}	//th[contains(text(),'MODEL NAME')]
${Solution_Id}	//th[contains(text(),'SOLUTION ID')]
${Status_Code}	//th[contains(text(),'STATUS CODE')]
${Revision_Id} 	 //th[contains(text(),'REVISION ID')]
${Date_Time}	//th[contains(text(),'DATE & TIME')]
${Status_OB}	 //th[contains(text(),'STATUS')]
${Action}	 //th[contains(text(),'Action')]

${All}    //a[@ng-click='totalElementsOnboardingTasks(0);select("0")'][contains(.,'All')]
${In_Progress}	 //a[contains(.,'In Progress')]
${Fail}	 //a[contains(.,'Fail')]
${Successful}	//a[contains(.,'Successful')] 

${searchModelTxtbox_Onboarding}		//input[contains(@placeholder,'Filter')]
${ModelName_MS}		//tbody//tr[1]//td[1]//span[1]
${success_status}	//tbody//tr[1]//td[6]
${Fail_status}		//tbody//tr[1]//td[6]

${View_Results}		//tbody//tr[1]//td[7]//button[1]
${Error-Pop-up}	    //md-toolbar[1]/div[1]/div[1]/h2[contains(text(),'')]
${Error-Pop-up_OK}	//button[@class='mdl-button mdl-js-button btn-primary']
  
#Descover Acumos links
${discover_Marketplace}    //h5[contains(text(),'Marketplace')]  #//main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/a/div[@class='discover-description']/h5[contains(text(),'Marketplace')]
${discover_DesignStudio}    //h5[contains(text(),'Design Studio')]  #//main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/a/div[@class='discover-description']/h5[contains(text(),'Design Studio')]
${discover_SDN_ONAP}    //h5[contains(text(),'SDN & ONAP')]  #//main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'SDN & ONAP')]
${discover_TeamUp}    (//h5[contains(text(),'Team Up')])[1]  #//main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'Team Up!')]
${discover_Onboarding}    (//div/market-home/section/div[3]/div[5]/div[2]/h5)[1]  #//main[@class='mdl-layout__content initialVal ']//section//div[@class='discover']/div/div[@class='discover-description']/h5[contains(text(),'Onboard with your Preferred Toolkit')]
#Check Published Model(Public) in My Model
${check_Image_loaded_PUB}   //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[3]/div/div[1]/div/div[1]/div[1]/figure/img[1]  #//div[@class='grid-outer-wrapper']/div[1]/div[1]//div[1]/div[1]/div[1]/figure/img[@class='img-rounded']
${image_Published_Public}    //div[@ng-if='hidePublic']/div[1]/div[1]/div[1]/div[@class='grid-top-section']/div[@class='mpdetailscontainer']/div/label/span[1]
#Check Published Model(Company) in My Model
# ${check_Image_loaded_COM}  //div[@id='md-manage-module-template']/div/div[2]/div/div[3]/div[2]/div[1]/div/div[1]/div[1]/figure/img[1]   #(//img[contains(@class,'img-rounded')])[1]  #//div[@ng-if='hideCompany']/div[1]/div[1]/div[@class='grid-top-section']/div/figure/img[@class='img-rounded']    
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
${select_MLP_SystemUser}    (//div[@class='md-text'][contains(.,'MLP System User')])[2]  #(//md-option[contains(@ng-repeat,'role in allRoles')])[4]  #//div[text()='MLP System User']//ancestor::div[contains(@class,"md-active")]//following-sibling::div[text()='MLP System User']/preceding-sibling::div[@class='md-container']//div[@class='md-icon']
${addBtn_AddUser}        //md-dialog[@role='dialog']//button[contains(text(),'Add')]    
${searchUser_UserManagement}    //*[contains(concat(' ', @class, ' '), 'user-mgmt-search-container')]//input[@ng-model='search']
${registeredAddUser_uname}    //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]//td[2]    #changed
${registeredAddUser_email}    //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]//td[3]    #changed
${registeredAddUser_role_MLPSysUser}    //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]/tr/td[4]/div[1]    #changed
${registeredAddUser_status}       //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )'][1]/tr/td[5]/label    #changed
${AddedUser_FirstChkBox}        //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )']//div[@class='md-container md-ink-ripple']   # //tbody[@ng-repeat='val in (filtertedUser = (userDetails | orderBy:orderByField:reverseSort | filter : searchData) )']//div[@class='md-container md-ink-ripple']    #added       
${bulkActionsDrpDwn}        //div[@class='admin-container-row1-inner3']//div[@class='note-btn-container']/md-select[@placeholder='Bulk Actions']    #added
${bulkAction_ActiveUserOption}    //md-option[@role='option']/div[contains(text(),'Active User')]    #added    
${UserMgmt_ApplyBtn}        //div[@class='admin-container-row1-inner3']/button[contains(text(),'Apply')]    #added
${confirmBtn_ActiveUserPopup}    //*[@id='confirmPopup']/md-dialog/md-dialog-actions//button[@ng-click='addRoleFunc(confirmFuncMsg)']    #added        
#Delete Published Model
${imageToDelete_Published}    //span[contains(@class,'griditem-title-text2')]                                
#SignUp Functionality
${signUpLink}    //header-nav[@class='mdl-layout__header is-casting-shadow']//ul[@ng-show='successfulLoginSigninSignup' and @aria-hidden='false']//a[contains(text(),'Sign Up')]    #changed
${firstNameInputbox}    //input[@name='firstName']
${lastNameInputbox}    //input[@name='lastName']
${signUpUserName}    //input[@name='username']
${signUpEmailId}     //input[@name='uemail']
${signUpPassword}        //input[@name='pwd']
${signUpConfirmPassword}        //input[@name='cpwd']
${signUpBtn}    //button[@ng-click='signUp()']
#Change Password On Account Settings Page
${changePasswordLink}    //a[@title='Change Password']
${CP_OldPassword}    //input[contains(@name,'oldPswd')]
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
${closeSignUp}    (//i[contains(@alt,'Close')])[3]
${closeSignIn}    (//md-icon[contains(@alt,'Close')])[3]
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
${WithdrawRequestBtn_Public}    //button[contains(text(),'Withdraw Request')]    
${PublishRequestIcon}        //span[@class='headertxtspan' and contains(text(),'Publish Request')]
${search_PublishRequest}    (//input[@type='search'])[2]
${approve_PublishRequest}    //div[@class='admin-action-container']/button[1][@name='approvePublishRequestModal']
${approveRequestPopup_Description}    //textarea[@ng-model='descriptionPop']
${approveBtn}        //div[@id='publishRequestModal']//button/span[contains(text(),'Approve')]
${searchedModelNameForApproval}    //publish-request//tbody/tr[1]/td/a/label[@class='model-name']
${requestorStatus}       //tbody//tr[1]//td[7]//label[1]  #//div/publish-request/div[2]/div/div[2]/table/tbody/tr[1]/td[6]/label 
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
${PublishedDescription_PB}     //div[1]/model-details[1]/div[2]/div[2]/div[1]/div[1]/div[2]/div[1]/div[3]/p[1]
#Description in Published to Company marketplace Model
${PublishedDescription_OR}    //div[@ng-show='showORDescription']/p[1]

# Notification Preferances
${NotificationPreferences}    (//span[text()='Notification Preferences'])[1]    
${NotificationQs}
${NotificationEmailId}
${NotificationPriority}
${selectPriority}
${PriorityMedium}
${NotificationTimeStamp}



