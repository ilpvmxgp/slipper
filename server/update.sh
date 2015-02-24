#!/bin/bash

SLIPPER_HOME=/home/$(whoami)/.slipper

cd $SLIPPER_HOME

address=$(curl -s ifconfig.me)

if [[ $address == "" ]]; then
    exit 1
fi

cat << EOF > addr.js
var slipper = {
    "addr": "$address"
}
EOF
echo -n $address > addr

git add .
git commit -m "commit by post.sh on $(date)" -a
git push origin master
