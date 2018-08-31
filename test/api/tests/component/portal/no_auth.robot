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
Documentation  This tests API response codes when using an unauthenticated connection.
...            Some of the Portal API calls require an Authorization token in the header.
...            Those calls should return a 401-Unauthorized response. All the rest should
...            return 200-OK.
Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../../resources/keywords/portal_keywords.robot
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/variables/common.robot

Suite Setup  Create Session No Auth  ${session_alias}  ${portal_base_url}
Suite Teardown  delete all sessions
*** Variables ***
${session_alias}  no-auth-session


*** Test Cases ***
Test No Auth Calls

Test Auth Calls
    [Documentation]  these should all fail with a 401

 .antMatchers("/auth/login").permitAll()
        .antMatchers("/cas/serviceValidate").permitAll()
        .antMatchers("/oauth/login/register").permitAll()
        .antMatchers("/oauth/login").permitAll()
        .antMatchers("/auth/validateToken").permitAll()
        .antMatchers("/users/register").permitAll()
        .antMatchers("/solutions").permitAll()
        .antMatchers("/portal/solutions").permitAll()
        .antMatchers("/solutions/{solutionId}").permitAll()
        .antMatchers("/webBasedOnBoarding/messagingStatus/{userId}/{trackingId}").permitAll()
        .antMatchers("/webBasedOnBoarding/stepResult/create").permitAll()
        .antMatchers("/auth/jwtToken").permitAll()
        .antMatchers("/filter/modeltype").permitAll()
        .antMatchers("/filter/toolkitType").permitAll()
        .antMatchers("/solution/updateViewCount/{solutionId}").permitAll()
        .antMatchers("/filter/accesstype").permitAll()
        .antMatchers("/swagger-ui.html").permitAll()
        .antMatchers("/readArtifactSolutions/{artifactId}").permitAll()
        .antMatchers("/getRelatedMySolutions").permitAll()
        .antMatchers("/validation/{taskId}").permitAll()
        .antMatchers("/solution/getRating/{solutionId}").permitAll()
        .antMatchers("/thread/{solutionId}/{revisionId}/{clientTimeZone}/comments").permitAll()
        .antMatchers("/thread/{threadId}/comment").permitAll()
        .antMatchers("/thread/{threadId}/childcomments").permitAll()
        .antMatchers("/solutions/{solutionId}/revisions").permitAll()
        .antMatchers("/solutions/{solutionId}/revisions/{revisionId}").permitAll()
        .antMatchers("/validation/{solutionId}/{revisionId}").permitAll()
        .antMatchers("/solution/avgRating/{solutionId}").permitAll()
        .antMatchers(HttpMethod.POST, "/users/userAccountDetails").permitAll()
        .antMatchers("/roleCounts").permitAll()
        .antMatchers(HttpMethod.GET, "/admin/config/{configKey}").permitAll()
        .antMatchers(HttpMethod.GET, "/users/qAUrl").permitAll()
        .antMatchers(HttpMethod.GET, "/users/docs").permitAll()
        .antMatchers("/users/userProfileImage/{userId}").permitAll()
        .antMatchers(HttpMethod.GET, "/admin/version").permitAll()
        .antMatchers("/users/forgetPassword").permitAll()
        .antMatchers(HttpMethod.GET, "/cas/enabled").permitAll()
        .antMatchers(HttpMethod.GET, "/admin/signup/enabled").permitAll()
        .antMatchers(HttpMethod.GET, "/getProtoFile").permitAll()
        .antMatchers(HttpMethod.GET, "/solution/{solutionId}/revision/{revisionId}/authors").permitAll()
        .antMatchers(HttpMethod.GET, "/cloudEnabled").permitAll()
        .antMatchers(HttpMethod.POST, "/users/verifyUser").permitAll()
        .antMatchers(HttpMethod.POST, "/users/resendVerifyToken").permitAll()
        .antMatchers(HttpMethod.POST, "/auth/validateApiToken").permitAll()
        .antMatchers(HttpMethod.GET, "/solution/{solutionId}/revision/{revisionId}/{accessType}/document").permitAll()
        .antMatchers(HttpMethod.GET, "/solution/revision/{revisionId}/{accessType}/description").permitAll()


*** Keywords ***

Call Get
    [Documentation]  Calls get request and checks status
    [Arguments]  ${endpoint}  ${expected_status_code}
    ${response}=  get request  ${endpoint}

Call Post
    [Documentation]  Calls get request and checks status
    [Arguments]  ${endpoint}  ${expected_status_code}

Call Put
    [Documentation]  Calls get request and checks status
    [Arguments]  ${endpoint}  ${expected_status_code}

Call Delete
    [Documentation]  Calls delete request and checks status; all these
    ...              calls should require authorization and therefore should
    ...              return 401 Unauthorized
    [Arguments]  ${endpoint}  ${expected_status_code}


