#!/usr/bin/env bash

set -ex

TAG=$1
if [ -z $TAG ]; then
    echo '"TAG" must be specified'
    exit 1
fi

CWD=$(pwd)
BUILD_PATH="${CWD}/build/$TAG"
TERRAFORM_PATH="${CWD}/terraform-website"
CONTENT_PATH="${TERRAFORM_PATH}/content"

rm -rf "${BUILD_PATH}"
mkdir -p "${BUILD_PATH}"

git clone "https://github.com/hashicorp/terraform-website.git" || true
cd "${TERRAFORM_PATH}"
git checkout -- .
make sync

cd "${CONTENT_PATH}"
# bundle update
bundle install

rm Rakefile || true
# cp "${CWD}/Rakefile" .
ln -s "${CWD}/Rakefile" || true

rake

mv Terraform.tgz "${BUILD_PATH}"
