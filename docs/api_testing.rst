.. ===============LICENSE_START=======================================================
.. Acumos CC-BY-4.0
.. ===================================================================================
.. Copyright (C) 2017-2018 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
.. ===================================================================================
.. This Acumos documentation file is distributed by AT&T and Tech Mahindra
.. under the Creative Commons Attribution 4.0 International License (the "License");
.. you may not use this file except in compliance with the License.
.. You may obtain a copy of the License at
..
.. http://creativecommons.org/licenses/by/4.0
..
.. This file is distributed on an "AS IS" BASIS,
.. WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
.. See the License for the specific language governing permissions and
.. limitations under the License.
.. ===============LICENSE_END=========================================================

=====================
Automated API Testing
=====================

Environment
===========
External libraries:

    * robotframework-requests
    *

How to Run
==========

.. code-block:: bash

    $ robot -d results -v ccds_user:<ccds user> -v ccds_password:<ccds password> -v url:<url:port/topContextPath>  tests/cds/role.robot

URL example:
For the Common Data Service API, the url parameter for dev would be:
``-v url:http://cognita-dev-vm01-core.eastus.cloudapp.azure.com:8000/ccds``
Substitute ist or ist2 for those environments.

Test Cases
==========

On-Board Model
--------------

Steps:

* Register User: create portal user using portal API (this creates user with default role)

    * POST /users/register
    * POST /users/verifyUser

* Onboard Model

    * Authorize user POST /onboarding-app/v2/auth logs user into portal and returns jwtToken

        * if successful, onboard model /onboarding-app/v2/models
    * if successful, fetch model
    * if successful, delete model
    * if successful, delete user
