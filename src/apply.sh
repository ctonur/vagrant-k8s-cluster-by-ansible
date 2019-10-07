#!/bin/bash -ex
 
# Declare an array of yaml

declare -a StringArray=("persistentvolume" "mysql-multi-persistent" "app-multi" )
 
for val in ${StringArray[@]}; do
   echo $val
   path=`pwd`
   echo $path
   cmd=`kubectl apply -f /vagrant/src/yaml/$val`

RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "apply success $cmd"
else
  echo "apply failed $cmd"
fi

done
