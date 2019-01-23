#!/bin/bash
# ===============LICENSE_START=======================================================
# Acumos Apache-2.0
# ===================================================================================
# Copyright (C) 2017-2018 AT&T Intellectual Property. All rights reserved.
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
#
# What this is: script to deploy a clean instance of the Acumos platform with
# all or selected components, starting from a new OS install or a previous
# Acumos deployment. The resulting platform deployment is an "all-in-one" (AIO)
# system that includes all components directly deployed by the options selected
# by the user, through the environment script AIO/acumos-env.sh.
#
# Prerequisites:
# - Target host OS Ubuntu Xenial (16.04), Bionic (18.04), or Centos 7
# - All hostnames specified in acumos-env.sh must be DNS-resolvable on all hosts
#   (entries in /etc/hosts or in an actual DNS server)
# - For deployments behind proxies, set HTTP_PROXY and HTTPS_PROXY in acumos-env.sh
# - For kubernetes based deplpyment: generic|OpenShift cluster deployed
# - Key-based SSH access from the server where you run this script, to the target
# - clone/checkout the branch, tag, or patch that you want to test into a
#   system-integration subfolder of where you run this script from
# - customize AIO/acumos-env.sh as needed for specific requirements
#
# Usage:
#   $ bash AIO-deploy.sh <key> <host> <user> <under> <k8sdist>
#      key: ssh key to use for access to the target host
#      host: target hostname (resolvable in DNS or via hosts file)
#      user: username on the target host
#      under: docker|k8s
#      k8sdist: for <under>="k8s", generic|openshift
#
set -x
trap 'fail' ERR

function fail() {
  exit 1
}

key=$1
host=$2
user=$3
under=$4
k8sdist=$5

eval `ssh-agent`; ssh-add $key

echo "Running clean.sh if needed on the target host"
ssh -x -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
  $user@$host mkdir -p /home/$user/AIO
scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  system-integration/AIO/clean.sh $user@$host:/home/$user/AIO/.
ssh -x -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
  $user@$host <<EOF
cd AIO
if [[ -e acumos-env.sh ]]; then bash clean.sh; fi
rm -rf *
EOF

scp -r -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  system-integration/AIO $user@$host:/home/$user/.
ssh -x -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  $user@$host <<EOF
trap 'exit 1' ERR
cd AIO
bash oneclick_deploy.sh $under $k8sdist
EOF
