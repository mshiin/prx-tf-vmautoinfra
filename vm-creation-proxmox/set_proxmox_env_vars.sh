#!/bin/bash

# Load the API tokens from the .env file
source .env
# You can call it outside the current like this
# source ../folder1/folder2/.env

# Export the API tokens as Terraform environment variables
export TF_VAR_pm_api_token_id=$PM_API_TOKEN_ID
export TF_VAR_pm_api_token_secret=$PM_API_TOKEN_SECRET

# Test that the environment variables are set
echo "Environment variables set:"
printenv TF_VAR_pm_api_token_id
printenv TF_VAR_pm_api_token_secret