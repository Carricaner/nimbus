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


## Archive
- [X] Use Terraform Docker image
    - NOT DO because the mans who conduct Terraform ought to be the man who's in charge of everything, so they should install all envs like: AWS CLI, Terraform and etc.