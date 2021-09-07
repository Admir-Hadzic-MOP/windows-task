# windows-task

The task for talent acquisition. Good luck:


01. Create a new branch and give it your name.

02. In the cloned repo, create a working folder and give it your name. Then, create a file structure inside as you see fit.

03. On your AWS account, create IAM Users using terraform:
	- terraform user
	- read-only user

04. Create using terraform:
	- VPC in eu-central-1 region
	- Route53 Private Zone
	- S3 Bucket
	- 1 EC2 Instance for domain controller role

05. Install Microsoft DNS and Active Directory Domain Services on EC2 instance

06. Create a GPO to append an AD DNS suffix to all computers in OU "Task Computers"

07. Create a bootstrap PowerShell script that will join new EC2 instances, created with terraform) to AD Domain and:
	- download a custom PowerShell script from your bucket
	- trigger downloaded script every Saturday at 00:00

08. Create a WSUS server using terraform and move it to OU "Admin Computers" 

09. WSUS server needs to act as a file server as well. Configure it

10. Create a test server with terraform and move it to OU "Task Computers."

11. Create an AD domain user and create a GPO that will allow this user to log only to computers located in OU "Task Computers"

12. Strictly control allowed traffic in VPC using Security Groups in terraform

13. Push your completed task to a GitHub repo and create a PR that will include:
	- access credentials for AWS account
	- access credentials for Active Directory
	- RDP instructions for your servers

13. Bonus Tasks
	- Create a Lambda that will take a snapshot of every EBS volume that contains a custom TAG
	- Using terraform, create additional VPC and connect it to the first VPS using VPC Peering
	- Apply security best practices to all tasks
	
