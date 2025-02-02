# Nimbus (Sub-minute Iterator)

## Description

Since AWS doesn’t provide a scheduler with period of second-level time resolution, Nimbus let users to trigger AWS Lambda functions repeatedly with second-level precision using EventBridge, Step Functions, and Terraform.

## Architecture
<img src="https://the-general.s3.ap-northeast-1.amazonaws.com/project/nimbus.svg" width="500" alt="Nimbus Architecture"/>

## State Machine of Steps Functions


<img src="https://the-general.s3.ap-northeast-1.amazonaws.com/project/stepfunctions_graph.svg" width="300" alt="State Machine"/>

## Commands
- Build the infrastrucutre
    
    ```bash
    make apply
    ```

    other commands like

    ```bash
    make plan ENV=prod
    ```

## Notes
- After moving into the env folder, apply it with a command like
    
    ```bash
    terraform apply \
    -var-file=../../shared/shared-variables.tfvars \
    -var-file=dev.tfvars
    ```
    - The order of files matters, since the latter will overwrite the former's values.

## TODO
- [V] Create a IAM user to be used by my local computer
- [V] Configure AWS S3 backend
- [V] Configure DynamoDB backend
- [] To deal with concurrency for a Lambda function

    Ref:
    
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


## Archive
- [X] Use Terraform Docker image
    - NOT DO because the mans who conduct Terraform ought to be the man who's in charge of everything, so they should install all envs like: AWS CLI, Terraform and etc.