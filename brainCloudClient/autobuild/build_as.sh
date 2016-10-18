set -e

build_version=$1

if [ "$build_version" == "" ]; then
  echo "Must pass in build version"
  exit 1
fi

rm -rf artifacts
mkdir -p artifacts/brainCloudClient
cp docs/README.txt artifacts/brainCloudClient
sed -i xxx "s/Platform.*/Platform\: ActionScript/" artifacts/brainCloudClient/README.TXT
sed -i xxx "s/Version.*/Version\: $build_version/" artifacts/brainCloudClient/README.TXT
rm artifacts/brainCloudClient/README.TXTxxx

cp -r ../src artifacts/brainCloudClient
pushd artifacts/brainCloudClient
zip -r ../brainCloudClient_actionScript_$build_version.zip .
popd
