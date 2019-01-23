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
# What this is: script to redeploy an instance of the Acumos platform with
# all or selected components, starting from a previous deployment, preserving
# current persistent data, and allowing reconfiguration of the deployment as
# supported, e.g. CDS version upgrade or component upgrade.
#
# Prerequisites:
# - Target host OS Ubuntu Xenial (16.04), Bionic (18.04), or Centos 7
# - All hostnames specified in acumos-env.sh must be DNS-resolvable on all hosts
#   (entries in /etc/hosts or in an actual DNS server)
# - For deployments behind proxies, set HTTP_PROXY and HTTPS_PROXY in acumos-env.sh
# - For kubernetes based deplpyment: generic|OpenShift cluster deployed
# - Key-based SSH access from the server where you run this script, to the target
# - clone/checkout the branch, tag, or patch that you want to test into a
#   system-integration subfolder of where you run this script from and cd to
#   the AIO subfolder
# - customize AIO/acumos-env.sh as needed for specific requirements
#
# Usage:
#   $ bash AIO-redeploy.sh <key> <host> <user> <env>
#      key: ssh key to use for access to the target host
#      host: target hostname (resolvable in DNS or via hosts file)
#      user: username on the target host
#      env: copy of acumos-env.sh from the previously deplpyed platform,
#           updated as desired to reconfigure it. If ACUMOS_CDS_PREVIOUS_VERSION
#           is "" (null), this script automatically set ACUMOS_CDS_PREVIOUS_VERSION
#           to the value of ACUMOS_CDS_VERSION before redeployment.
#
set -x
trap 'fail' ERR

function fail() {
  exit 1
}

function update_env() {
  # Reuse existing values if set
  if [[ "$2" == "" ]]; then
    log "Updating $env with \"export $1=$3\""
    sed -i -- "s/$1=.*/$1=$3/" $env
    export $1=$3
  fi
}

key=$1
host=$2
user=$3
env=$4

eval `ssh-agent`; ssh-add $key

source $env
update_env ACUMOS_CDS_PREVIOUS_VERSION "$ACUMOS_CDS_PREVIOUS_VERSION" \

scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  $env $user@$host:/home/$user/acumos-env.sh
ssh -x -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
  $user@$host <<EOF
trap 'exit 1' ERR
cd AIO
bash oneclick_deploy.sh $DEPLOYED_UNDER $K8S_DIST
EOF
