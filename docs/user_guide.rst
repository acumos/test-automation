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
====================================================
Acumos Test Automation User Guide
====================================================


1. Introduction
======================

	This is a user’s guide that describes how to execute the test automation.
    The purpose of the acumos test automation is to execute the acumos test scenarios using automation scripts. 	



2. Basic Building Blocks of Acumos Test Automation
==================================================

	Acumos test automation build on the Robot framework. Robot Framework is generic open source, application and technology independent framework. It Python-based testing framework for the automation.



3. To Run The Automation Suite
===============================

To run the test scripts present in the suite file we need to run the automation suite file. Ex. AcumosTestSuite.robot

We can run this suite file using the Jenkins job and also by using the below command 
robot   acumosTestSuite.robot


4. Output of Execution of Automation Suite
==========================================

Test Automation execution of acumos will generate the below important files

1. Test Log File
Log file show the output of each step for an automation script.

2.  Test Report File
Report file  show the detailed report of status of executed test scripts with pass/fail and execution time required for the same.



