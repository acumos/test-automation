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
Documentation  Common keywords for Portal API tests
Library  RequestsLibrary
Library  Collections
Library  String
Library  json


*** Variables ***



*** Keywords ***
Call Portal Login
    [Documentation]  Logs a user into the Portal
    ...              POST /auth/login
    ...              Returns org.acumos.portal.be.transport.User object as JSON
    ...              Arguments:
    ...              session_alias: name of the existing session to use for this request
    ...              username: username with which to log into the portal
    ...              password: password for username
    ...              Returns a dictionary with two entries: response_status_code and response_json
    ...              logs the request body, the response, and the response json
    [Arguments]  ${session_alias}  ${username}  ${password}
    ${body}=  catenate  {
    ...    "request_body": {
    ...                    "username": "${username}",
    ...                    "password": "${password}"
    ...                  }
    ...  }
    log  ${body}
    ${response}=  post request  ${session_alias}  /auth/login  data=${body}
    log  ${response}
    ${reponse_json}=  set variable  ${response.json()}
    log  ${reponse_json}
    ${response_headers}=  set variable  ${response.headers}
    log  ${response_headers}
    # this returns a RequestsCookieJar[] list
    @{response_cookies}=  set variable  ${response.cookies}
    log  @{response_cookies}
    :FOR  ${item_dict}  in  @{response_cookies.items()}
    \  log  ${item_dict}


    ${return_value} =  create dictionary  response_status_code=${response.status_code}  response_json=${reponse_json}
    [Return]  ${return_value}

Call Portal Logout
    [Documentation]  Logs a user out of the Portal
    ...              POST /auth/logout
    ...              Arguments:
    ...              session_alias: name of the existing session to use for this request
    ...              login_response_json: response json body from when the user logged in
    ...              user_password: password for the logged in user
    ...              Returns a dictionary with two entries: response_status_code and response_json
    ...              logs the request body, the response, and the response json
    [Arguments]  ${auth_session_alias}  ${login_response_json}  ${user_password}
    log  ${login_response_json}
    ${return_username}=  get from dictionary  ${login_response_json}  username
    ${return_fn}=  get from dictionary  ${login_response_json}  firstName
    ${return_ln}=  get from dictionary  ${login_response_json}  lastName
    ${return_emailId}=  get from dictionary  ${login_response_json}  emailId
    ${return_userId}=  get from dictionary  ${login_response_json}  userId
    ${return_active}=  get from dictionary  ${login_response_json}  active
    ${return_lastLogin}=  get from dictionary  ${login_response_json}  lastLogin
    ${return_loginPassExpire}=  get from dictionary  ${login_response_json}  loginPassExpire
    ${request_body}=  catenate  {
    ...    "request_body": {
    ...                    "firstName": "${return_fn}",
    ...                    "lastName": "${return_ln}",
    ...                    "loginName": "${return_username}",
    ...                    "username":  "${return_username}",
    ...                    "password": "${user_password}",
    ...                    "emailId": "${return_emailId}",
    ...                    "active": "${return_active}",
    ...                    "userId": "${return_userId}",
    ...                    "lastLogin": "${return_lastLogin}",
    ...                    "loginPassExpire": "${return_loginPassExpire}"
    ...                  }
    ...  }
    # user1.setUserId("8cbeccd0-ed84-42c3-8d9a-06d5629dc7bb");
         #		user1.setFirstName("UserFirstName");
         #		user1.setLastName("UserLastName");
         #		user1.setUsername("User1");
         #		user1.setEmailId("user1@emial.com");
         #		user1.setActive("Y");
         #		user1.setPassword("password");
    log  ${request_body}
    #  24 Aug 2018 - logout doesn't invalidate tokens
    ${response}=  post request  ${auth_session_alias}  /auth/logout  data=${request_body}
    log  ${response}
    log  ${response.json()}
    ${json}=  set variable  ${response.json()}
    ${return_value} =  create dictionary  response_status_code=${response.status_code}  response_json=${json}
    [Return]  ${return_value}

Call Register User
    [Documentation]  Creates a new user using the Portal API  POST /users/register.
    ...              The Portal assigns a default role to the user upon creation.
    ...              Arguments:
    ...              session_alias: name of the existing session to use for this request
    ...              user_first_name: first name for new portal user
    ...              user_last_name: last name for new portal user
    ...              user_username: username with which to log into the portal
    ...              user_password: password for new user
    ...              user_email: email address of new user
    ...              Returns a dictionary with two entries: response_status_code and response_json
    ...              logs the request body, the response, and the response json

    [Arguments]     ${session_alias}  ${user_first_name}  ${user_last_name}
    ...             ${user_username}  ${user_password}  ${user_email}

    ${body}=  catenate  {
    ...    "request_body": {
    ...                    "firstName": "${user_first_name}",
    ...                    "lastName": "${user_last_name}",
    ...                    "username": "${user_username}",
    ...                    "password": "${user_password}",
    ...                    "emailId": "${user_email}",
    ...                    "userId": "true",
    ...                  }
    ...  }
    log  ${body}
    ${response}=  post request  ${session_alias}  /users/register  data=${body}
    log  ${response}
    log  ${response.json()}
    ${json}=  set variable  ${response.json()}
    ${return_value} =  create dictionary  response_status_code=${response.status_code}  response_json=${json}
    [Return]  ${return_value}

Call Verify User
    [Documentation]  Verifies a newly registered using the Portal API  POST /users/verifyUser
    ...              This takes the place of manually clicking the link in the email.
    ...              Arguments:
    ...              session_alias: name of the existing session to use for this request
    ...              user_json: json for user to be verified; this is fetched from CDS in the calling keyword
    ...              Returns a dictionary with two entries: response_status_code and response_json
    ...              logs the request body, the response, and the response json
    [Arguments]  ${session_alias}  ${login_name}  ${verify_token}
        ${body}=  catenate  {
    ...    "request_body": {
    ...                    "loginName": "${login_name}",
    ...                    "username": "${login_name}",
    ...                    "verifyToken": "${verify_token}",
    ...                  }
    ...   }
    ${response}=  post request  ${session_alias}  /users/verify  data=${body}
    log  ${response}
    log  ${response.json()}
    ${json}=  set variable  ${response.json()}
    ${return_value} =  create dictionary  response_status_code=${response.status_code}  response_json=${json}
    [Return]  ${return_value}

Call Delete User
    [Documentation]  Deletes a list of users POST /users/user/deleteUser
    ...              User doing the deleting must be logged into the Portal and have an Admin role
    ...              Arguments:
    ...              session_alias: name of the existing session to use for this request
    ...              json_body: response json body from when the user logged; userIdList populated
    ...              Returns a dictionary with two entries: response_status_code and response_json
    ...              logs the request body, the response, and the response json

    [Arguments]     ${session_alias}  ${json_body}  ${list_userIDs_to_delete}

    log  ${json_body}
    log  ${list_userIDs_to_delete}
    ${response}=  post request  ${session_alias}  /users/user/deleteUser  data=${json_body}
    log  ${response}
    log  ${response.json()}
    ${json}=  set variable  ${response.json()}
    ${return_value} =  create dictionary  response_status_code=${response.status_code}  response_json=${json}
    [Return]  ${return_value}

*** PORTAL LOGIN EXAMPLE RESPONSE ***
|  {
|  'loginPassExpire': False,
|   'userAssignedRolesList': None,
|    'firstName': 'Betty',
|     'lastName': 'Boop',
|      'emailId': 'betty@boop.com',
|       'username': 'bettyboop',
|        'password': None,
|         'active': 'true',
|          'lastLogin': 1535381743027,
|           'created': 1519427393000,
|            'modified': None,
|             'userId': '569f2a6c-101f-484b-b616-3b6ea805117d',
|              'loginName': None,
|               'orgName': None,
|                'picture': None,
|                 'jwttoken': None,
|                  'role': None,
|                   'roleId': None,
|                    'updatedRole': None,
|                     'updatedRoleId': None,
|                      'userIdList': None,
|                       'userNewRoleList': None,
|                        'userRolesList': None,
|                         'bulkUpdate': None,
|                          'apiTokenHash': None,
|                           'verifyToken': None,
|                            'status': None,
|                             'jwtToken': None
|                             }


@Test
	public void logoutTest(){
		User user1 = new User();
		user1.setUserId("8cbeccd0-ed84-42c3-8d9a-06d5629dc7bb");
		user1.setFirstName("UserFirstName");
		user1.setLastName("UserLastName");
		user1.setUsername("User1");
		user1.setEmailId("user1@emial.com");
		user1.setActive("Y");
		user1.setPassword("password");
		JsonRequest<User> user = new JsonRequest<>();
		user.setBody(user1);
		JsonResponse<Object> responseObject  = authServiceController.logout(request, user , response);
		Assert.assertNull(responseObject);
	}