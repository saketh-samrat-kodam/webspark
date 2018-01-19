#!/bin/bash
InstanceId="$1"
#region="$2"
InstanceType="$2"
crnt_inst_type=$(aws ec2 describe-instances --region us-east-2 --instance-ids $1 --output text --query 'Reservations[*].Instances[*].[InstanceType]')
running_status=$(aws ec2 describe-instance-status --region us-east-2 --instance-id $1 --query InstanceStatuses[].InstanceState.Name --output text)
echo "$1"
echo "$crnt_inst_type"
echo "$running_status"
if [[ $running_status == "running" ]] || [[ $running_status != "running" ]]
 then
        stop_instances=$(aws ec2 stop-instances --region us-east-2 --instance-ids $1 --query StoppingInstances[].CurrentState.Name --output text ; sleep 50)
        echo "$stop_instances"

        if [[ $crnt_inst_type != $2 ]]
         then
        upgrade=$(aws ec2 modify-instance-attribute --region us-east-2 --instance-id $1 --instance-type "{\"Value\": \"$2\"}")
        aft_upgrade=$(aws ec2 describe-instances --region us-east-2 --instance-ids $1 --output text --query 'Reservations[*].Instances[*].[InstanceType]')
        echo "$aft_upgrade"
                else
                   echo "InstancesType are same"
         fi

        if [[ $aft_upgrade == "$2" ]]
        then
        start_instances=$(aws ec2 start-instances --region us-east-2 --instance-ids $1 --query StartingInstances[].CurrentState.Name --output text ; sleep 50)
        echo " Successfully instances has been upgraded and Running "
        fi
else
                echo "Enter the InstanceId which you want to updgrade"
                fi

