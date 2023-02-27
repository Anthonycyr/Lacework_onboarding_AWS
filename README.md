# Lacework_onboarding_AWS

### Install Terraform and the Lacework CLI in AWS CloudShell
1.   [Log in to the AWS Console](https://signin.aws.amazon.com) and go to AWS CloudShell.
2. Launch a new CloudShell.
3. Once CloudShell is provisioned, copy and paste the following command to run the shell_startup.sh script and install Terraform and the Lacework CLI:
```
curl https://raw.githubusercontent.com/lacework/terraform-provisioning/main/aws/shell_startup.sh | bash
```
4. In the Lacework console generate an API Key
## Configure the CLI
Use the `lacework configure` command in AWS CloudShell to configure the CLI with the API key downloaded from the previous step.
```
lacework configure
Account: example
Access Key ID: EXAMPLE_1234567890ABCDE1EXAMPLE1EXAMPLE123456789EXAMPLE
Secret Access Key: **********************************
You are all set!
```
The `lacework configure` command generates a file named `.lacework.toml` inside your home directory (`$HOME/.lacework.toml`) with a single profile named `default`.
## Deploy New CloudTrail and Add Configuration Assessment
1. clone the repositories with the terraform file
2. terraform init
3. terraform plan
4. terraform apply
## Validate Configuration
### CLI
To validate the integration using the CLI, open a Terminal and run `lacework cloud-account list`. You should see two integrations: `AwsCfg` for the Config integration, and `AwsCtSqs` for the CloudTrail integration.
### Console
To validate the integration using the Lacework Console, log in to your account and go to **Settings > Integrations > Cloud Accounts**.
