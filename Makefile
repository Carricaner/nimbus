# Define the shared variables file and default environment
SHARED_VARS = ../../shared/shared-variables.tfvars
DEFAULT_ENV = dev

# Environment to use (default to `DEFAULT_ENV` if not set)
ENV ?= $(DEFAULT_ENV)
ENV_DIR = ./envs/$(ENV)
ENV_VARS = $(ENV_DIR)/$(ENV).tfvars

# Terraform command to run (default is `apply`)
CMD ?= apply

# Check if environment directory and tfvars file exist
check-env:
	@if [ ! -d "$(ENV_DIR)" ]; then \
		echo "Error: Environment directory $(ENV_DIR) does not exist."; \
		exit 1; \
	fi
	@if [ ! -f "$(ENV_VARS)" ]; then \
		echo "Error: Variables file $(ENV_VARS) does not exist."; \
		exit 1; \
	fi

# Run Terraform commands
terraform: check-env
	cd $(ENV_DIR) && terraform $(CMD) -var-file=$(SHARED_VARS) -var-file=$(ENV).tfvars

# Common Terraform targets
plan: CMD=plan
plan: terraform

apply: CMD=apply
apply: terraform

destroy: CMD=destroy
destroy: terraform

# Clean up Terraform state lock files
unlock:
	@find ./envs -name ".terraform.lock.hcl" -exec rm -f {} \;
	@find ./envs -name ".terraform" -type d -exec rm -rf {} \;
	@echo "Terraform lock files and state removed."

# Display help
help:
	@echo "Usage:"
	@echo "  make [TARGET] ENV=[environment]"
	@echo ""
	@echo "Targets:"
	@echo "  plan        Run 'terraform plan' for the specified environment"
	@echo "  apply       Run 'terraform apply' for the specified environment"
	@echo "  destroy     Run 'terraform destroy' for the specified environment"
	@echo "  unlock      Remove Terraform lock files and directories"
	@echo "  help        Display this help message"
	@echo ""
	@echo "Environment:"
	@echo "  ENV         Specify the environment (default: dev)"
	@echo ""
	@echo "Examples:"
	@echo "  make plan ENV=prod"
	@echo "  make apply ENV=dev"
	@echo "  make destroy ENV=prod"