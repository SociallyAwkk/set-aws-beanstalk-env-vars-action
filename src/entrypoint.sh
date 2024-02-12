#!/bin/sh -l

aws_access_key_id=$1
aws_secret_access_key=$2
aws_region=$3
application_name=$4
environment_name=$5
env_vars=$6

aws configure set aws_access_key_id $aws_access_key_id
aws configure set aws_secret_access_key $aws_secret_access_key
aws configure set region $aws_region

IFS=' ' read -ra ADDR <<< "$env_vars"
for i in "${ADDR[@]}"; do
    IFS='=' read -ra KV <<< "$i"
    aws elasticbeanstalk update-environment --application-name $application_name --environment-name $environment_name --option-settings Namespace=aws:elasticbeanstalk:application:environment,OptionName=${KV[0]},Value=${KV[1]}
    while [[ "$(aws elasticbeanstalk describe-environments --application-name $application_name --environment-names $environment_name --query 'Environments[0].Status' --output text)" != "Ready" ]]; do
        echo "Waiting for environment to become Ready..."
        sleep 20
    done
done
