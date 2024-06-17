#!/bin/bash

set -e

if [ -z $1 ]; then
  echo "Please set the 'version' variable"
  exit 1
fi

VERSION="$1"

cd $(dirname $0)

# The temporary directory to clone Trivy adapter source code
TEMP=$(mktemp -d ${TMPDIR-/tmp}/trivy-adapter.XXXXXX)
git clone -b $VERSION --depth 1 https://github.com/aquasecurity/harbor-scanner-trivy.git $TEMP

echo "Building Trivy adapter binary based on golang:1.21.8..."
for arch in amd64 arm64; do
	docker build -f Dockerfile.binary --build-arg GOARCH=$arch -o binary/$arch/ $TEMP
done

echo "Building Trivy adapter binary finished successfully"
rm -rf $TEMP
