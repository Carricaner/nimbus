## Notes
- After moving into the env folder, apply it with a command like
    
    ```bash
    terraform apply \
    -var-file=../../shared/shared-variables.tfvars \
    -var-file=dev.tfvars
    ```
    - The order of files matters, since the latter will overwrite the former's values.

## TODO
- Use Terraform Docker image
- [V] Create a IAM user to be used by my local computer
- [V] Configure AWS S3 backend
- [V] Configure DynamoDB backend

