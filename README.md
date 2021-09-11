# Steps to Run this Terraform Script

1. Install terraform on your server/system

    https://learn.hashicorp.com/tutorials/terraform/install-cli 

    https://www.terraform.io/downloads.html

2. Setup environment variable for AWS authentication
    - In Linux Environment 

        $ export AWS_ACCESS_KEY_ID="anaccesskey"

        $ export AWS_SECRET_ACCESS_KEY="asecretkey"

    - In windows Environment 

        $env:AWS_ACCESS_KEY_ID="anaccesskey"

        $env:AWS_SECRET_ACCESS_KEY="asecretkey"

3. Initialize the terraform

    terraform init

5. Run the terraform plan/apply

        terraform plan

        terraform apply

6. For destroying the resources run this commands

        terraform destroy
