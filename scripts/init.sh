#!/bin/sh

echo "==== Update submodules  ===="
git submodule update --init --recursive

echo "==== Download JDK ===="
pushd packages/java
sh download-and-add-blob.sh
popd

