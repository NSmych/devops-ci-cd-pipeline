# devops-ci-cd-pipeline
Example CI/CD pipeline for a microservice using AWS, Terraform, and Jenkins

# -------------- Docker -------------- #
To build docker image run this command from base folder
`docker build --platform=linux/amd64 -t nsmych/greeting-container -f docker/Dockerfile .`

After, push new image to the Docker Hub
`docker push nsmych/greeting-container:latest`

# -------------- Terraform -------------- #

Run EC2 instance with current service on it
If project never initialized run
`terraform init`

To check current instructions run
`terraform plan`

If everything OK and looks like you wanted it (planned it) run
`terraform apply`

# -------------- Jenkins -------------- #

