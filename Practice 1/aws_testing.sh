#!/bin/bash

# AWS region
REGION="us-east-1"
VPC_ID="" 				#vpc-xxxxxxxx
PUBLIC_SUBNET_ID="" 	#subnet-xxxxxxxx
PRIVATE_SUBNET_ID="" 	#subnet-xxxxxxxx
PUBLIC_INSTANCE_ID="" 	#i-xxxxxxxxxxxxxxxxx
PRIVATE_INSTANCE_ID="" 	#i-xxxxxxxxxxxxxxxxx
PUBLIC_SG_ID="" 		#sg-xxxxxxxx
PRIVATE_SG_ID="" 		#sg-xxxxxxxx

# VPC
echo "Check VPC exist, CIDR block..."
aws ec2 describe-vpcs --vpc-ids $VPC_ID --region $REGION | grep -q "\"CidrBlock\": \"10.0.0.0/16\""
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "Sai hoặc không tồn tại."
fi

# Subnets
echo "Check Public Subnet..."
aws ec2 describe-subnets --subnet-ids $PUBLIC_SUBNET_ID --region $REGION | grep -q "\"MapPublicIpOnLaunch\": true"
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "No Public IP will be created"
fi

echo "Check Private Subnet..."
aws ec2 describe-subnets --subnet-ids $PRIVATE_SUBNET_ID --region $REGION | grep -q "\"MapPublicIpOnLaunch\": false"
if [ $? -eq 0 ]; then
    echo "OK (No Public IP will be created)"
else
    echo "Have Public IP"
fi

# Internet Gateway và NAT Gateway
echo "Check Internet Gateway..."
aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$VPC_ID" --region $REGION | grep -q "InternetGatewayId"
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "Not Exist or Not link"
fi

echo "Check NAT Gateway..."
aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=$VPC_ID" --region $REGION | grep -q "NatGatewayId"
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "Not Exist"
fi

# Route Tables
echo "Check Route Table (Public Subnet)..."
aws ec2 describe-route-tables --filters "Name=association.subnet-id,Values=$PUBLIC_SUBNET_ID" --region $REGION | grep -q "\"GatewayId\": \"igw"
if [ $? -eq 0 ]; then
    echo "OK (Routing)"
else
    echo "No routing to Internet Gateway."
fi

echo "Check Route Table (Private Subnet)..."
aws ec2 describe-route-tables --filters "Name=association.subnet-id,Values=$PRIVATE_SUBNET_ID" --region $REGION | grep -q "\"NatGatewayId\": \"nat"
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "No routing to NAT Gateway."
fi

# EC2 Instances
echo "Check Public EC2 Instance..."
aws ec2 describe-instances --instance-ids $PUBLIC_INSTANCE_ID --region $REGION | grep -q "\"PublicIpAddress\":"
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "No Public IP."
fi

echo "Check Private EC2 Instance..."
aws ec2 describe-instances --instance-ids $PRIVATE_INSTANCE_ID --region $REGION | grep -q "\"PublicIpAddress\":"
if [ $? -eq 0 ]; then
    echo "Have Public IP"
else
    echo "OK"
fi

# Security Groups
echo "Check Security Group Public EC2 to SSH..."
aws ec2 describe-security-groups --group-ids $PUBLIC_SG_ID --region $REGION | grep -q "\"FromPort\": 22"
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "Not allow"
fi

echo "Check Security Group Private EC2 to SSH..."
aws ec2 describe-security-groups --group-ids $PRIVATE_SG_ID --region $REGION | grep -q "\"UserIdGroupPairs\":"
if [ $? -eq 0 ]; then
    echo "OK (only allow SSH from Public EC2)"
else
    echo "Allow access from another source"
fi

echo "All Done!"
