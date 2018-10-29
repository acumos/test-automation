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
*** variables ***
#Acumos Configurations
${BROWSER}                 Firefox
${URL}    

#Acumos Data#
${username}                  
${password}                  
${SearchModelName_Public}   Pub_0806_Model    #Should be unpublished
${SearchModelName_Company}  Company_0806_Model    #Should be unpublished
${DeleteModelName}          Delete_0806_Model    #Should be unpublished    
${SearchModelName_MyModel}  Gen_0806_Model    #Should be unpublished
${Published_DeleteModelName}    ${SearchModelName_Company}        #using model which publihsed in company using Published To Company Marketplace scenario  