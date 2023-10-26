# devops-ci-cd-pipeline
Example CI/CD pipeline for a web page using AWS, Terraform, and Jenkins <br>
// This project is in WIP status. Later it will be updated with Ansible and K8s

# -------------- Docker -------------- #
To build docker image run this command from base folder <br>
`docker build --platform=linux/amd64 -t nsmych/greeting-container -f docker/Dockerfile .`

After, push new image to the Docker Hub <br>
`docker push nsmych/greeting-container:latest`

# -------------- Terraform -------------- #

Edit `devops-ci-cd-pipeline/terraform/modules/ec2/key_management.tf` file <br>
Provide the path to your local key for **public_key**.

Run EC2 instance with current service on it <br>
If project never initialized run <br>
`terraform init`

To check current instructions run <br>
`terraform plan`

If everything OK and looks like you wanted it (planned it) run <br>
`terraform apply`

# -------------- Jenkins -------------- #

Open page `<your_jenkins_instance_IP_address>:8080` <br>
Follow the instructions
