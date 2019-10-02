#!/bin/bash -ex
 
# Declare an array of yaml
declare -a StringArray=("persistentvolume" "mysql-multi-persistent" "app-multi" )
 
for val in ${StringArray[@]}; do
   echo $val
   cmd=`kubectl apply -f yaml/$val`

RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "apply success $cmd"
else
  echo "apply failed $cmd"
fi

done
