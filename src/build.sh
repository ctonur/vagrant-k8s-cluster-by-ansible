#!/bin/bash -xe

imagename="app"
cd "/vagrant/src"
build=`make build TAG=latest  APP=app`

RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "build success"
else
  echo "build failed"
fi

