# Practice 2
Manage and deploy AWS infrastructure and apply microservices with Terraform, CloudFormation, GitHub Actions, AWS CodePipeline and Jenkins

## Pratice 2 requirements
1. Deploy AWS infrastructure using Terraform and automating process with with GitHub Actions
  * Use Terraform to deploy AWS Services including VPC, Route Tables, NAT Gateway, EC2, Security Groups which are performed in Pratice 1
  * Automate deploying process with GitHub Actions
  * Integrate Checkov to ensure security in Terraform source code
2. Deploy AWS infrastructure with CloudFormation and automate building and deploying process with AWS CodePipeline
  * Use CloudFormation to deploy AWS Services including VPC, Route Tables, NAT Gateway, EC2, Security Groups which are performed in Pratice 1
  * Use AWS CodeBuild, integrate cfn-lint and Taskcat to check the correctness of Terraform source code
  * Use AWS Code Pipeline to automate building and deploying process from the source code on CodeCommit
3. Use Jenkins to manage CI/CD process for microservice application 
  * Use Jenkins to manage building, testing and deploying process of microservices application on Docker, Kubernetes (or a similar service)
  * Integrate SonarQube to ensure source code quality
  * Be able to integrate tools to test security such as Snyk or Trivy to enhance source code safety (optional)

## Tasks' links of Lab 2
Since every task need to integrate CI/CD pipeline in building, testing and deploying process, we have separated tasks into independent reposistory.
Here are links to navigate to every task:
- Task 1: https://github.com/kusanali3110/NT548-Lab2-Task1
- Task 2: (Working in process)
- Task 3: (Working in process)

