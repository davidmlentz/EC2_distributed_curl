#!/bin/bash

# TODO: add --region to the terminate-instances command

while IFS= read -r instance_id; do
	aws ec2 terminate-instances --instance-ids $instance_id
done < runninginstances
