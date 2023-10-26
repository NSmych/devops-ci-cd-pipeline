# devops-ci-cd-pipeline
Example CI/CD pipeline for a web page using AWS, Terraform, and Jenkins
// This project is in WIP status. Later it will be updated with Ansible and K8s

# -------------- Docker -------------- #
To build docker image run this command from base folder
`docker build --platform=linux/amd64 -t nsmych/greeting-container -f docker/Dockerfile .`

After, push new image to the Docker Hub
`docker push nsmych/greeting-container:latest`

# -------------- Terraform -------------- #

Edit `devops-ci-cd-pipeline/terraform/modules/ec2/key_management.tf` file
Provide the path to your local key for **public_key**.

Run EC2 instance with current service on it
If project never initialized run
`terraform init`

To check current instructions run
`terraform plan`

If everything OK and looks like you wanted it (planned it) run
`terraform apply`

# -------------- Jenkins -------------- #

Open page `<your_jenkins_instance_IP_address>:8080`
Follow the instructions
