#!/bin/sh

echo "Killing atomic-enterprise all-in-one server ..."
killall atomic-enterprise 

echo "Cleaning up atomic-enterprise runtime files ..."
rm -rf openshift.local.*

echo "Stopping all k8s docker containers on host ..."
docker ps | awk 'index($NF,"k8s_")==1 { print $1 }' | xargs -l -r docker stop
