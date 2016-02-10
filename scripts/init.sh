#!/bin/sh

echo "==== Update submodules  ===="
# Update submodule pointers; Clean out any submodule changes
git submodule sync
git submodule foreach --recursive 'git submodule sync; git clean -d --force --force'

# Update submodule content, checkout if necessary
git submodule update --init --recursive --force


echo "==== Prepare Blob (java) ===="
pushd packages/java
sh download-and-add-blob.sh
popd

echo "==== Prepare Blob (demo) ===="
pushd src/demo
./mvnw clean package -Dmaven.test.skip=true
cd ../..
bosh add blob src/demo/target/demo-0.0.1.RELEASE.jar demo
popd

