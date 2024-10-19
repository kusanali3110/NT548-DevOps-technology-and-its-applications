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
3. Generate a key pair which can be used to SSH to deployed instances
```
ssh-keygen -i <your directory to save> -t rsa
```
4. Open file 'main.tf'
```
sudo nano main.tf
```
At the line 24, point to your public key with following syntax: ```public_key = file("<path of your public key>")```. After that, press "Ctrl + O" and "Ctrl + X" to save the file and exit.

5. Initialize Terraform
```
terraform init
```
6. Apply writen Terraform configuration
```
terraform apply -auto-approve
```
7. We can see the Terraform plan by this command
```
terraform plan
```
Now the AWS Infrastructure is completely deployed

### CloudFormation
1. Clone this project with this git command
```
git clone https://github.com/nahidacunny/NT548-DevOps-technology-and-its-applications.git
```
2. Change the directory to ./Pratice 1/Terraform
```
cd ./Pratice 1/Terraform
```
3. Open file 'cloudformation.yaml'
```
sudo nano cloudformation.yaml
```
* At the line 119, replace with your public ip ( use the broadcast /32 format). You find your public ip at https://whatismyipaddress.com/.
* At the line 137, repale with the name of your key pair, which you created on AWS console.
* At lines 141 and 153, replace with an appropriate AMI ID. You can find this in the AWS Management Console (EC2 -> EC2 Dashboard -> Launch Instance -> Choose an * 
  Amazon Machine Image -> Get AMI ID). Note: AMI ID varies by region.
4. Confige AWS CLI
```
aws configure
```
When you create users on AWS console , you must generate access key then fill in following requires.
* AWS Access Key ID. 
* AWS Secret Access Key.
* Default region name (Example: us-east-1).
* Default output format (Choose json or text).

5. Check validate the CloudFormation Template
```
aws cloudformation validate-template --template-body file://path/to/your-template.yaml
```
Replace path/to/your-template.yaml with the actual path to your template file. In my case is path/to/cloudformation.yaml
6.Deploy the CloudFormation Stack Using AWS CLI
* Create stack
```
aws cloudformation create-stack \
  --stack-name YourStackName \
  --template-body file://path/to/your-template.yaml \
  --capabilities CAPABILITY_NAMED_IAM
```
* Replace YourStackName with your desired stack name, e.g., MySecureVPCStack.
* Replace file://path/to/your-template.yaml with the actual path to your template file
* Example:
 ```
{
  "StackId": "arn:aws:cloudformation:us-east-1:123456789012:stack/MySecureVPCStack/abcd1234-ef56-7890-gh12-ijkl3456mnop"
}
```
7. Check stack status
```
aws cloudformation describe-stacks --stack-name YourStackName
```
* Look for the "StackStatus" field in the output, which will show values like CREATE_IN_PROGRESS, CREATE_COMPLETE, etc..

8. Check resource on AWS console
* When field in the output, which will show valuse like CREATE_COMPLETE. Then check on AWS console.

## Test all deployed services (working in progress)
