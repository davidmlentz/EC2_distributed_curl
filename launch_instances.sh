#!/bin/bash

# Creates EC2 instances in several regions.
# Adds the userdata.sh file from this repository as userdata for each instance.
# Adds the ID of each instance into the runninginstances file.

aws ec2 run-instances --region us-west-1 --image-id ami-0e4035ae3f70c400f --instance-type t2.micro --key-name MyCaliforniaKeyPair --user-data file://userdata.sh | grep InstanceId | sed 's/^\(.*\)": "\(.*\)",$/\2/' >> runninginstances

echo $(date)
echo "Launched one in us-west-1."

aws ec2 run-instances --region ap-northeast-1  --image-id ami-0ce107ae7af2e92b5 --instance-type t2.micro --user-data file://userdata.sh | grep InstanceId | sed 's/^\(.*\)": "\(.*\)",$/\2/' >> runninginstances
echo $(date)
echo "Launched one in ap-northeast-1."

aws ec2 run-instances --region sa-east-1 --image-id ami-02898a1921d38a50b --instance-type t2.micro --user-data file://userdata.sh | grep InstanceId | sed 's/^\(.*\)": "\(.*\)",$/\2/' >> runninginstances
echo $(date)
echo "Launched one in sa-east-1."

aws ec2 run-instances --region ap-northeast-2 --image-id ami-0493ab99920f410fc --instance-type t2.micro --user-data file://userdata.sh | grep InstanceId | sed 's/^\(.*\)": "\(.*\)",$/\2/' >> runninginstances
echo $(date)
echo "Launched one in ap-northeast-2. All done."
