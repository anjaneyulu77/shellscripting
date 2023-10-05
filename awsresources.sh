#!/bin/bash

set -x
echo "this is list of buckets"
aws s3 ls

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

aws lambda list-functions

aws iam list-users
