#!/bin/bash

# This script is added to each instance as userdata
# Dynamically adds the region and timestamp to one of the requests.
# Surely this comes out as a 404, but adds this info to the CloudFront logs.

yum update 

HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/hostname)
REGION=`echo $HOSTNAME | sed 's/^\(.*\)\.\(.*\)\.\(.*\)\.\(.*\)$/\2/g'`

while true; do
	curl http://dfmy0s6mufitx.cloudfront.net/$REGION/$(date +%Y%M%d_%H%M%S%Z)
        curl http://dfmy0s6mufitx.cloudfront.net/
	sleep $(( $RANDOM % 3 + 1 ))
done
