#!/bin/bash

# AWS EC2 instance details
AMI_ID="ami-025b4b7b37b743227"
INSTANCE_TYPE="t2.micro"
KEY_NAME="pp"
SECURITY_GROUP_ID="sg-0d5e9dcce6eb500af"
SUBNET_ID="subnet-0992c644dd9b07553"
# Launch EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id "$AMI_ID" \
  --instance-type "$INSTANCE_TYPE" \
  --key-name "$KEY_NAME" \
  --security-group-ids "$SECURITY_GROUP_ID" \
  --subnet-id "$SUBNET_ID" \
  --output text --query 'Instances[0].InstanceId'
)
# Wait until the instance is running
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID"
echo "EC2 instance $INSTANCE_ID is now running!"
