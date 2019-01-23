<!---
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
-->

This folder contain tests relating to the OA&M functions provided by the
system-integration and platform-oam repos provided by the OA&M project.

# Folder Structure

* "tests" directory: test scripts for single components
* "tests/integration": test scripts that operate on multiple components

# Tests Included

## OneClick All-in-One (AIO) Tests

The test scripts below can be used to deploy AIO platforms under docker,
generic k8s, and OpenShift (the "okd" or AIO variant), for the listed test
scenarios:

* aio-deploy: clean deploy of all or selected components under an AIO target
  host, starting from a clean OS install or a previously installed AIO platform

  * deploy under Ubuntu Xenial (docker or generic k8s), Ubuntu Bionic (docker or
    generic k8s), or Centos 7 (OpenShift only)
  * use existing, external deployments for one or more of MariaDB, Nexus,
    Docker-engine, ELK
  * deploy with/without Kong
  * select component versions (must be compatible with the tested AIO version
    e.g. the included templates)
  * select various values for variables in acumos-env.sh

* aio-redeploy: redeployment of all or selected components over an existing
  deployment, preserving persistent data, with optional reconfiguration of the
  platform as supported (e.g. database upgrade)

  * select component versions (must be compatible with the tested AIO version
    e.g. the included templates)
  * select various values for variables in acumos-env.sh

### Support Tools

The test scripts above are supplemented by the following scripts that support
prerequisite steps, and for various test scenarios that verify basic platform
functionality:

* Test tools provided by the system-integration repo (AIO folder)

  * aio-create-user: create user with a role, using the portal registration and
    CDS APIs
  * aio-onboarding: onboarding a model using the CLI
  * aio-peering: create peer relationships for two AIO deployments
  * aio-subscription: create mirror subscriptions for a selected set of solution
    types between two AIO peers

* Prerequisites support tools provided by the system-integration repo
  (i the tools folder)

  * setup-docker
  * setup_openshift
  * setup_openshift_client

* Prerequisites support tools provided by the kubernetes-client repo
  (in the deploy/private folder)

  * setup_k8s
  * setup-kubectl
