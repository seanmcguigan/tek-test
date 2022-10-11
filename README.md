# Infrastructure
Ideally we would front the lambda function with apigateway.(not implemented)

# Deployment
Automated deployment with github actions. Branch from the development branch, create a PR (runs "Terraform Plan" workflow - adds plan as comment to the PR).
Merge to deploy to development environment (runs development workflow). To pass through environments tag for release ("staging-*", "prod-*") 

# Testing
Suggested testing github action: (not implemented yet!)
https://terraform-compliance.com/
https://github.com/newcontext-oss/kitchen-terraform

# Security 
terraform provider access shold be locked to account/permission sets.
```
provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = "456789101112" # development account
  assume_role {
    role_arn     = "arn:aws:iam::456789101112:role/deployment" # assumed execution role allowed to create required resources.
    session_name = "deployment-infrastructure-terraform"
  }
}
```
# Cost and governance tools
Also built into ci runs on PRs - infra costs - https://www.infracost.io/docs/
Additional to this would be a more comprehensive tool such as https://cloudhealth.vmware.com/solutions/aws-management.html
