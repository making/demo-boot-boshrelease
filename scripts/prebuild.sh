#/bin/sh

echo "== pre-build demo =="
pushd src/demo
./mvnw clean package -Dmaven.test.skip=true
popd
