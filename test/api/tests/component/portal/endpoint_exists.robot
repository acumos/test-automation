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
Documentation  This tests API for a response when using an unauthenticated connection.
...            The response code should not equal 404.
...            Inherently flawed. Even unsecured API calls may return a 401 is
...            something is wrong with the target environment.

Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../../resources/keywords/portal_keywords.robot
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/variables/common.robot

Suite Setup  Create Session No Auth  ${session_alias}  ${portal_base_url}
Suite Teardown  delete all sessions

# robot -d results/portal/endpoint-exists  tests/component/portal/endpoint_exists.robot

*** Variables ***
${session_alias}  endpoint-exists-session


*** Test Cases ***
Test Delete Endpoints
    [Documentation]  This tests verifies the "delete" endpoints exist.
    ...              No request body nor authorization is sent. No real values
    ...              are used.
    call delete portal  /admin/config/{configKey}
    call delete portal  /admin/peers/{peerId}
    call delete portal  /admin/peer/subcription/delete/{subId}
    call delete portal  /deleteRoleFunction/{roleId}/{roleFunctionId}
    call delete portal  /deleteRole/{roleId}
    call delete portal  /dropTag/{solutionId}/tag/{tag}
    call delete portal  /notifications/delete/{notificationId}
    call delete portal  /notifications/drop/{notificationId}/user/{userId}
    call delete portal  /solution/userAccess/{solutionId}/delete/{userId}
    call delete portal  /webBasedOnBoarding/stepResult/delete/{stepResultId}

Test Get Endpoints
    [Documentation]  This tests verifies the "get" endpoints exist.
    ...              No request body nor authorization is sent. No real values
    ...              are used.
    call get portal   /admin/config/{configKey}
    call get portal   /admin/dashboard
    call get portal   /admin/peers/{peerId}
    call get portal   /admin/peer/subcription/{subId}
    call get portal   /admin/signup/enabled
    call get portal   /admin/version
    call get portal   /cas/enabled
    call get portal   /cas/serviceValidate
    call get portal   /cloudEnabled
    call get portal   /comments/{threadId}/{commentId}
    call get portal   /downloads/{solutionId}
    call get portal   /filter/accesstype
    call get portal   /filter/modeltype
    call get portal   /filter/toolkitType
    call get portal   /gateway/ping/{peerId}
    call get portal   /gateway/{solutionId}/solution/{peerId}
    call get portal   /properties/cliAuthUrl
    call get portal   /properties/cliPushUrl
    call get portal   /getProtoFile
    call get portal   /notifications/count
    call get portal   /notifications/notifications
    call get portal   /notifications/pref/byUserId/{userId}
    call get portal   /readArtifactSolutions/{artifactId}
    call get portal   /roleFunction/{roleId}/{roleFunctionId}
    call get portal   /roles
    call get portal   /roles/count
    call get portal   /roles/{roleId}
    call get portal   /roles/{userId}
    call get portal   /searchSolutions
    call get portal   /solution/avgRating/{solutionId}
    call get portal   /solution/getFavoriteSolutions/{userId}
    call get portal   /solution/revision/document/{documentId}
    call get portal   /solution/revision/{revisionId}/{accessType}/description
    call get portal   /solution/{solutionId}/revision/{revisionId}/authors
    call get portal   /solution/userAccess/{solutionId}
    call get portal   /solutions/shared/{userId}
    call get portal   /solutions/{solutionId}
    call get portal   /solutions/{solutionId}/revisions
    call get portal   /solutions/{solutionId}/revisions/{revisionId}
    call get portal   /thread/count
    call get portal   /thread/{threadId}
    call get portal   /thread/{threadId}/comments/count
    call get portal   /users/activeUserDetails/{active}
    call get portal   /users/docs
    call get portal   /users/imagesize
    call get portal   /users/qAUrl
    call get portal   /users/userDetails
    call get portal   /users/userProfile
    call get portal   /users/userProfileImage/{userId}
    call get portal   /users/userRole/{userId}
    call get portal   /validation/{solutionId}/{revisionId}
    call get portal   /webBasedOnBoarding/checkOnapCompatible/{solutionId}/{revisionId}
    call get portal   /webBasedOnBoarding/messagingStatus/search/{solutionId}/{revisionId}
    call get portal   /webBasedOnBoarding/stepStatuses
    call get portal   /webBasedOnBoarding/stepTypes

Test Post Endpoints
    [Documentation]  This tests verifies the "post" endpoints exist.
    ...              No request body nor authorization is sent. No real values
    ...              are used.
    call post portal    /admin/addUser
    call post portal    /admin/config
    call post portal    /admin/paginatedPeers
    call post portal    /admin/peers
    call post portal    /admin/peer/sub/create/{peerId}
    call post portal    /admin/peer/subcription/create
    call post portal    /admin/peer/subcriptions/{peerId}
    call post portal    /admin/requests
    call post portal    /auth/jwtToken
    call post portal    /auth/login
    call post portal    /auth/logout
    call post portal    /auth/validateApiToken
    call post portal    /auth/validateToken
    call post portal    /auth/validationStatus
    call post portal    /comments/create
    call post portal    /comments/delete/{threadId}/{commentId}
    call post portal    /createRole
    call post portal    /createRoleFunction
    call post portal    /gateway/solutions
    call post portal    /getRelatedMySolutions
    call post portal    /model/upload/{userId}
    call post portal    /notifications/{userId}
    call post portal    /notifications/sendUserNotification
    call post portal    /oauth/login
    call post portal    /oauth/login/register
    call post portal    /paginatedSolutions
    call post portal    /portal/solutions
    call post portal    /roles/updateRole
    call post portal    /searchSolutionsTags/{tags}
    call post portal    /solution/createFavorite
    call post portal    /solution/createRating
    call post portal    /solution/deleteFavorite
    call post portal    /solution/getRating/{solutionId}
    call post portal    /solution/revision/{revisionId}/{accessType}/description
    call post portal    /solution/{solutionId}/updateImage
    call post portal    /solution/userAccess/{solutionId}/add
    call post portal    /solutions/ratings/{solutionId}/user/{userId}
    call post portal    /tags/create
    call post portal    /thread
    call post portal    /thread/create
    call post portal    /thread/delete/{threadId}
    call post portal    /thread/{solutionId}/{revisionId}
    call post portal    /thread/{solutionId}/{revisionId}/{clientTimeZone}/comments
    call post portal    /thread/{threadId}/childcomments
    call post portal    /thread/{threadId}/comment
    call post portal    /userAccess/solution/{userId}
    call post portal    /user/solutions
    call post portal    /users/refreshApiToken
    call post portal    /users/register
    call post portal    /users/resendVerifyToken
    call post portal    /users/updateUserImage/{userId}
    call post portal    /users/userAccountDetails
    call post portal    /users/verifyUser
    call post portal    /users/user/deleteUser
    call post portal    /webBasedOnBoarding/addToCatalog/{userId}
    call post portal    /webBasedOnBoarding/broker
    call post portal    /webBasedOnBoarding/convertToOnap/{solutionId}/{revisionId}/{userId}/{modName}
    call post portal    /webBasedOnBoarding/messagingStatus/{userId}/{trackingId}

Test Put Endpoints
    [Documentation]  This tests verifies the "put" endpoints exist.
    ...              No request body nor authorization is sent. No real values
    ...              are used.
    call put portal    /addTag/{solutionId}/tag/{tag}
    call put portal    /admin/config/{configKey}
    call put portal    /admin/peers/{peerId}
    call put portal    /admin/peer/subcription/update
    call put portal    /admin/request/update
    call put portal    /comments/update
    call put portal    /notifications/create/{notificationId}/user/{userId}
    call put portal    /notifications/createNotification
    call put portal    /notifications/pref/create
    call put portal    /notifications/pref/update
    call put portal    /notifications/view/{notificationId}/user/{userId}
    call put portal    /publish/{solutionId}
    call put portal    /roles/user/change
    call put portal    /solution/{solutionId}/revision/{revisionId}/authors
    call put portal    /solution/{solutionId}/revision/{revisionId}/removeAuthor
    call put portal    /solution/{solutionId}/revision/{revisionId}/{accessType}/copyDocuments/{fromRevisionId}
    call put portal    /solution/{solutionId}/revision/{revisionId}/{accessType}/document
    call put portal    /solution/{solutionId}/revision/{revisionId}/{accessType}/document/{documentId}
    call put portal    /solution/updateRating
    call put portal    /solution/updateViewCount/{solutionId}
    call put portal    /solution/userAccess/{solutionId}
    call put portal    /solutions/{solutionId}
    call put portal    /tags
    call put portal    /thread/update
    call put portal    /unpublish/{solutionId}
    call put portal    /updateRole/{roleId}
    call put portal    /updateRoleFunction
    call put portal    /users/changePassword
    call put portal    /users/forgetPassword
    call put portal    /users/updateUser
    call put portal    /users/user/updateUser
    call put portal    /validation/{taskId}
    call put portal    /webBasedOnBoarding/stepResult/create
    call put portal    /webBasedOnBoarding/stepResult/update

*** Keywords ***
Call Get Portal
    [Documentation]  Calls get request and verifies a response is returned
    ...              and that response's status code is not 404
    [Arguments]  ${endpoint}
    ${response}=  get request  ${session_alias}  ${endpoint}
    log  ${endpoint}
    should not be equal as strings  404  ${response.status_code}
    log  ${response}

Call Post Portal
    [Documentation]  Calls post request and verifies a response is returned
    ...              and that response's status code is not 404
    [Arguments]  ${endpoint}
    ${response}=  post request  ${session_alias}  ${endpoint}
    log  ${endpoint}
    should not be equal as strings  404  ${response.status_code}
    log  ${response}

Call Put Portal
    [Documentation]  Calls put request and verifies a response is returned
    ...              and that response's status code is not 404
    [Arguments]  ${endpoint}
    ${response}=  put request  ${session_alias}  ${endpoint}
    log  ${endpoint}
    should not be equal as strings  404  ${response.status_code}
    log  ${response}

Call Delete Portal
    [Documentation]  Calls delete request and verifies a response is returned
    ...              and that response's status code is not 404
    [Arguments]  ${endpoint}
    ${response}=  delete request  ${session_alias}  ${endpoint}
    log  ${endpoint}
    should not be equal as strings  404  ${response.status_code}
    log  ${response}



