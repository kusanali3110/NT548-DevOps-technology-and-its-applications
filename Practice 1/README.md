## Practice 1 preview
- Use Terraform and CloudFormation to automatically manage and deploy AWS infrastructure, including serveral services such as VPC, Route Tables, NAT Gateway, EC2s and Security Groups
- Requirement:
  * All services need to be writen as modules
  * Ensure security for EC2s (configured in Security Groups)
  * There are also test cases to guarantee all services are deployed successfully
 

## Before getting started
We need to meet these requirements in order to do this pratice:
  * An AWS account
  * AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
  * Terraform: https://developer.hashicorp.com/terraform/install


## Start deploying with:
### Terraform
1. Clone this project with this git command
```
git clone https://github.com/nahidacunny/NT548-DevOps-technology-and-its-applications.git
```
2. Change the directory to ./Pratice 1/Terraform
```
cd ./Pratice 1/Terraform
```
3. Initialize Terraform
```
terraform init
```
4. Apply writen Terraform configuration
```
terraform apply -auto-approve
```
5. We can see the Terraform plan by this command
```
terraform plan
```
Now the AWS Infrastructure is completely deployed

### CloudFormation (working in progress)

## Test all deployed services (working in progress)
