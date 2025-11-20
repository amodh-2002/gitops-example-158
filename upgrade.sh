#!/bin/bash

set -e

new_ver=$1

echo "Upgrading to version: $new_ver"

docker tag nginx:1.29.3 howaboutwepullsomeimages/nginx:${new_ver}
docker push howaboutwepullsomeimages/nginx:${new_ver}

tmp_dir=$(mktemp -d)
echo "Cloning infra repo to $tmp_dir"

git clone git@github.com:amodh-2002/public-example-158.git $tmp_dir

sed -i '' -e "s/howaboutwepullsomeimages\/nginx:.*/howaboutwepullsomeimages\/nginx:${new_ver}/g" $tmp_dir/my-app/1-deployment.yaml

cd $tmp_dir
git add .
git commit -m "Upgraded nginx to version ${new_ver}"
git push origin main
echo "Upgrade process completed."


rm -rf $tmp_dir
