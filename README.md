# Nimbus (Sub-minute Iterator)

## Description

Since AWS doesn’t provide a scheduler with period of second-level time resolution, Nimbus let users to trigger AWS Lambda functions repeatedly with second-level precision using EventBridge, Step Functions, and Terraform.

## Architecture
<img src="https://the-general.s3.ap-northeast-1.amazonaws.com/project/nimbus.svg" width="500" alt="Nimbus Architecture"/>

## State Machine of Steps Functions

<img src="https://the-general.s3.ap-northeast-1.amazonaws.com/project/stepfunctions_graph.svg" width="270" alt="State Machine"/>

## Prerequisites

- Terraform
- AWS CLI

## Steps
1. Configure AWS CLI and make sure the IAM user has corresponding rights
    
    ```shell
    aws configure
    ```

2. Log in for Terraform
    
    ```shell
    terraform login
    ```

3. Configure the backend for Terraform under `./envs/dev/terraform.tf`, and the format is like:
    
    ```terraform
    terraform {
    backend "s3" {
        bucket         = <the-bucket>
        key            = <the-object-key>
        region         = <the-regions>
        encrypt        = true
        dynamodb_table = <the-table-name>
    }

    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.80"
        }
    }
    }
    ```

4. Initialize Terraform
    
    ```shell
    terraform init
    ```

5. Plan & apply the infrastructure
    
    ```shell
    make apply
    ```

## Other Notes
- After moving into the env folder, apply it with a command like
    
    ```bash
    terraform apply \
    -var-file=../../shared/shared-variables.tfvars \
    -var-file=dev.tfvars
    ```
    - The order of files matters, since the latter will overwrite the former's values.

## TODO
- To deal with concurrency for the Lambda function
    - Ref:
        ```python
        import boto3
        client = boto3.client('stepfunctions')
        def lambda_handler(event, context):
            response = client.list_executions(
                stateMachineArn='arn:aws:states:REGION:ACCOUNTID:stateMachine:LambdaSubMinute',
                statusFilter='RUNNING'
            )
            return {
                'alreadyRunning': len(response['executions']) > 1
        ```
