# 🚀 Proxmox VM automation via Terraform 🚀

## ✨ Improvements based on Chris Lempa's template

---

### 🗄️ File management/separation
I separated the Terraform automation code into three main files to help organise the codebase and make it more manageable.

File|Description
---|---
**main.tf**|Typically contains the actual resource definitions and configuration blocks that define how the infrastructure should be provisioned.
**terraform.auto.tfvars**|Used to store sensitive or environment-specific variables like VM-specific configurations. This file can be checked into version control, as it should not contain sensitive information such as API keys. Users only need to make changes here to clone VM's in Proxmox.
**variables.tf**|Declares the variables used in the main.tf file, including their type and any default values. This file helps ensure consistency and provides a clear overview of the variables used in the Terraform automation code.

<p>&nbsp;</p>

### 🔐 Securing API Keys
The better approach for using credentials in Terraform involves setting environment variables for the sensitive data, which are picked up by Terraform automatically. Here's an example:

```bash
export TF_VAR_pm_api_token_id="your_token_id_here"
export TF_VAR_pm_api_token_secret="your_token_secret_here"
```

This sets two environment variables, <font color="f03c15"> **TF_VARS_proxmox_api_token_id**</font> and <font color="f03c15">**TF_VARS_proxmox_api_token_secret**</font>, and exports them so they are available to Terraform. The values are your actual API token ID and secret, respectively.

👉 You can also add these lines to your <font color="f03c15">**~/.bashrc**</font> or <font color="f03c15">**~/.bash_profile**</font> file to make them persistent and always available in your shell.

<p>&nbsp;</p>

When you run <font color="f03c15">**terraform apply**</font> or <font color="f03c15">**terraform plan**</font>, Terraform will automatically pick up these environment variables and use them as the values for the corresponding variables in your Terraform configuration.

<font color="c5f015">Checkout</font> Chris Lempa's template --> <https://github.com/ChristianLempa/boilerplates/tree/main/terraform/proxmox>
<p>&nbsp;</p>

---

## Create and use an .env file to store your API tokens

1. Create a file called .env in the **outside** of the terraform directory (if you haven't already done so).

```bash
touch .env
```

2. Open the .env file in a text editor (e.g. nano, vim, etc.).

```bash
nano .env
```

3. Add the following lines to the .env file, replacing your_token_id_here and your_token_secret_here with your actual API token values:

```bash
PM_API_TOKEN_ID='your_token_id_here'
PM_API_TOKEN_SECRET='your_token_secret_here'
```

4. Save and close the .env file.

5. Make sure you add .env to your .gitignore file so that it's not accidentally committed to version control.

6. Create set_proxmox_env_vars.sh file and set the execute perms

```bash
chmod +x set_proxmox_env_vars.sh
```

7. Copy/paste the script to load the API tokens from the .env file:

```bash
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
```

8. Run the script:

```bash
source ./set_proxmox_env_vars.sh
```

---
## Run the whole thing
1. terraform init
2. terraform plan
3. terraform output
4. terraform apply

*<font color="f03c15">Note</font>: It is important to note that running the terraform apply command will make changes to the infrastructure, so it should be used with caution.*
<p>&nbsp;</p>
*This automation needs to have proper testing and review processes in place before applying changes to production environments or even implementing CI/CD pipeline for best practice.*
<p>&nbsp;</p>
*Also need to implement backend tfstate backups, whether its in S3 bucket, Azure containers or HashiCloud*
