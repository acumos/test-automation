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
Documentation  searches for users
Library  RequestsLibrary
Library  Collections
Library  String
Resource  ../../../resources/keywords/cds_keywords.robot
Resource  ../../../resources/keywords/session_keywords.robot
Resource  ../../../resources/variables/common.robot

Suite Setup  create session basic auth  ${cds_base_url}  ${cds_search_session}  ${cds_auth_user}  ${cds_auth_password}
Suite Teardown  delete all sessions

# robot -d results -v ccds_user:<insert user name here> -v ccds_password:<insert password here> -v url:<insert base url with port and context path here>  tests/cds/search.robot

# *****THIS NEEDS TO BE REFACTORED and parameterized *****

*** Variables ***
${cds_search_session}  cds_search_session


*** Test Cases ***
Search By Valid Email
    Search By Email  aimeeu.opensource@gmail.com
    Search By Email  aimeeu@research.att.com
Search By Valid LoginName
    Search By LoginName  apiTestUser
Search By Valid Last Name
    Search By LastName  Ukasick
Search For Active Users
    Search By Active  True


*** Keywords ***
Search By Email
    [Documentation]  Searches for users using the fieldName=fieldValue pairs specified as query parameters
    ...              GET /ccds/user/search
    [Arguments]  ${email}

    ${searchKeyValues_dict}=  create dictionary  email=${email}
    ${response_dict}=  call search by query parameters  ${searchKeyValues_dict}  ${cds_search_session}
    # email should be unique
    # response.json() returns a dictionary; the content element contains a list of dictionaries
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${json}=  get from dictionary  ${response_dict}  response_json
    ${total_elements}=  get from dictionary  ${json}  totalElements
    should be true  ${totalElements} == 1
    # get value of content key; this value is a list of dictionaries
    @{content_list}=  get from dictionary  ${json}  content
    :FOR  ${item_dict}  in  @{content_list}
    \  log  ${item_dict}
    \  ${found_element}=  set variable  ${item_dict['email']}
    \  should be equal as strings  ${email}  ${found_element}


Search By LoginName
    [Documentation]  Searches for users using the field name - field value pairs specified as query parameters
    ...              GET /ccds/user/search
    [Arguments]  ${loginName}

    ${searchKeyValues_dict}=  create dictionary  loginName=${loginName}
    ${response_dict}=  call search by query parameters  ${searchKeyValues_dict}  ${cds_search_session}
    # loginName should be unique
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${json}=  get from dictionary  ${response_dict}  response_json
    ${total_elements}=  get from dictionary  ${json}  totalElements
    should be true  ${totalElements} == 1
    # get value of content key; this value is a list of dictionaries
    @{content_list}=  get from dictionary  ${json}  content
    :FOR  ${item_dict}  in  @{content_list}
    \  log  ${item_dict}
    \  ${found_element}=  set variable  ${item_dict['loginName']}
    \  should be equal as strings  ${loginName}  ${found_element}

Search By LastName
    [Documentation]  Searches for users using the field name - field value pairs specified as query parameters
    ...              GET /ccds/user/search
    [Arguments]  ${lastName}

    ${searchKeyValues_dict}=  create dictionary  lastName=${lastName}
    ${response_dict}=  call search by query parameters  ${searchKeyValues_dict}  ${cds_search_session}
    # lastName may not be unique
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${json}=  get from dictionary  ${response_dict}  response_json
    ${total_elements}=  get from dictionary  ${json}  totalElements
    should be true  ${totalElements} > 0
    # get value of content key; this value is a list of dictionaries
    @{content_list}=  get from dictionary  ${json}  content
    :FOR  ${item_dict}  in  @{content_list}
    \  log  ${item_dict}
    \  ${found_element}=  set variable  ${item_dict['lastName']}
    \  should be equal as strings  ${lastName}  ${found_element}

Search By Active
    [Documentation]  Searches for users using the field name - field value pairs specified as query parameters
    ...              GET /ccds/user/search
    [Arguments]  ${active}

    ${searchKeyValues_dict}=  create dictionary  active=${active}
    ${response_dict}=  call search by query parameters  ${searchKeyValues_dict}  ${cds_search_session}
    # active may not be unique
    ${status_code}=  get from dictionary  ${response_dict}  response_status_code
    should be equal as strings  ${status_code}  200
    ${json}=  get from dictionary  ${response_dict}  response_json
    ${total_elements}=  get from dictionary  ${json}  totalElements
    should be true  ${totalElements} > 0
    # get value of content key; this value is a list of dictionaries
    @{content_list}=  get from dictionary  ${json}  content
    :FOR  ${item_dict}  in  @{content_list}
    \  log  ${item_dict}
    \  ${found_element}=  set variable  ${item_dict['active']}
    \  should be equal as strings  ${active}  ${found_element}

*** Example JSON Response ***
|  {
|  'content': [
|   {
|    'created': 1534972697000,
|    'modified': 1535113548000,
|    'userId': 'dcb3b8cb-927a-4f0d-8d19-b1415148b5f4',
|    'firstName': 'API',
|    'middleName': None,
|    'lastName': 'Tester',
|    'orgName': None,
|    'email': 'aimeeu.opensource@gmail.com',
|    'loginName': 'apiTestUser',
|    'loginHash': None,
|    'loginPassExpire': None,
|    'authToken': 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhcGlUZXN0VXNlciIsInJvbGUiOlt7InBlcm1pc3Npb25MaXN0IjpudWxsLCJyb2xlQ291bnQiOjAsInJvbGVJZCI6IjEyMzQ1Njc4LWFiY2QtOTBhYi1jZGVmLTEyMzQ1Njc4OTBhYiIsIm5hbWUiOiJNTFAgU3lzdGVtIFVzZXIiLCJhY3RpdmUiOmZhbHNlLCJjcmVhdGVkIjoxNTEyNTk2NzkxMDAwLCJtb2RpZmllZCI6bnVsbH1dLCJjcmVhdGVkIjoxNTM1MTEzNTQ4MDI3LCJleHAiOjE1MzUxOTM1NDgsIm1scHVzZXIiOnsiY3JlYXRlZCI6MTUzNDk3MjY5NzAwMCwibW9kaWZpZWQiOjE1MzUxMTM1NDc4ODMsInVzZXJJZCI6ImRjYjNiOGNiLTkyN2EtNGYwZC04ZDE5LWIxNDE1MTQ4YjVmNCIsImZpcnN0TmFtZSI6IkFQSSIsIm1pZGRsZU5hbWUiOm51bGwsImxhc3ROYW1lIjoiVGVzdGVyIiwib3JnTmFtZSI6bnVsbCwiZW1haWwiOiJhaW1lZXUub3BlbnNvdXJjZUBnbWFpbC5jb20iLCJsb2dpbk5hbWUiOiJhcGlUZXN0VXNlciIsImxvZ2luSGFzaCI6bnVsbCwibG9naW5QYXNzRXhwaXJlIjpudWxsLCJhdXRoVG9rZW4iOm51bGwsImFjdGl2ZSI6dHJ1ZSwibGFzdExvZ2luIjoxNTM1MTEzNTQ3OTA0LCJsb2dpbkZhaWxDb3VudCI6bnVsbCwibG9naW5GYWlsRGF0ZSI6bnVsbCwicGljdHVyZSI6bnVsbCwiYXBpVG9rZW4iOiIxZGNjMmUwMzU0ZWQ0NGY5YjFjODg4Y2I5MzZhM2RhMSIsInZlcmlmeVRva2VuSGFzaCI6bnVsbCwidmVyaWZ5RXhwaXJhdGlvbiI6bnVsbH19.5FClDb9Z1cxlAc0b1LAR3-L01qs6Tn0TL_gTMQQAMQzwdsYNic82rfxTIbahWVhaGaBxtqT0zGBksDhqmSSj1Q',
|    'active': True,
|    'lastLogin': 1535113547000,
|    'loginFailCount': None,
|    'loginFailDate': None,
|    'picture': None,
|    'apiToken': '1dcc2e0354ed44f9b1c888cb936a3da1',
|    'verifyTokenHash': None,
|    'verifyExpiration': None
|    }
|  ],
|  'totalPages': 1,
|  'totalElements': 1,
|  'last': True,
|  'sort': None,
|  'first': True,
|  'numberOfElements': 1,
|  'size': 20,
|  'number': 0
|  }