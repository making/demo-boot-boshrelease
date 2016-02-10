#!/bin/sh

echo "==== Update submodules  ===="
git submodule update --init --recursive

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

