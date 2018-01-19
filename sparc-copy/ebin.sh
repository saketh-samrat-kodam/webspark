#!/bin/bash

projid=$projectid

echo "pid"

$projectid."' '".$instance."' '".$type."' '".$region.

#Setting the project
gcloud config set project $projectid

#Setting default region
gcloud config set compute/region $region

#Stoping the instance
gcloud  compute instances stop $instance

#Changing the machine types
gcloud compute instances set-machine-type $instance --machine-type $type

#restarting the  instance
gcloud compute instances start $instance





