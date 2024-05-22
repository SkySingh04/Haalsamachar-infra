## HaalSamachar Infrastructure Repository : The Haalsamachar App's infrastructure is managed through an Infrastructure as Code (IaC) approach, incorporating Terraform scripts, Kubernetes manifests, and GitOps configurations. This ensures automated, scalable, and consistent deployment of resources.

## [HaalSamachar Application Repository](https://github.com/Akash-Singh04/haalsamachar-app) : Consists of Backend Microservices built with GoLang including a GraphQL API built using gqlgen and four REST APIs built using Gin and frontend built with NextJs+TypeScript with PostgreSQL powered database, containerized using Docker using Dockerfiles and CI/CD pipeline configurations.

## Setting Up Kubernetes Cluster

The kubernetes deployment configuration yaml files are located in `/deployment` directory. These can be modified to scale the number of pods and other configurations as per requirements.

To deploy HaalSamachar using Kubernetes, follow these steps:

1. **Install Kubernetes:** Set up a Kubernetes cluster on your preferred cloud provider or locally using Minikube.

2. **Apply Manifests:** Use `kubectl apply /deployments` command to apply the Kubernetes manifests and deploy the HaalSamachar application to the Kubernetes cluster.

6. **Monitor and Scale:** Monitor the deployed application using Kubernetes monitoring tools and scale the application as needed to handle varying loads.

For detailed instructions on setting up the Kubernetes cluster and deploying HaalSamachar, refer to the documentation provided by your Kubernetes provider or the Kubernetes official documentation.

## Terraform Folder

The **Terraform** folder in the HaalSamachar Infrastructure Repository is designed to manage and provision the necessary cloud infrastructure for deploying the HaalSamachar application. It includes scripts for setting up AWS resources such as Elastic Container Registry (ECR) and Elastic Container Service (ECS). Here's a breakdown of its structure and components:

### ECR Folder

The **ECR** folder contains Terraform scripts to create and manage Amazon ECR repositories. These repositories are used to store Docker images of the HaalSamachar application. Key files include:

- **main.tf**: Defines the ECR repository resource.
- **variables.tf**: Contains the input variables required for the ECR configuration, such as repository names.

### ECS Folder

The **ECS** folder contains Terraform scripts to set up the ECS cluster and related resources. This includes:

- **main.tf**: Defines the ECS cluster, services, and task definitions. It also includes networking configurations like VPC, subnets, and security groups. This file orchestrates the overall infrastructure setup for the ECS environment.
- **variables.tf**: Contains input variables required for ECS setup, such as cluster name, task definitions, and networking details. This allows for flexible and reusable configurations across different environments.
- **vpc.tf**: Defines the Virtual Private Cloud (VPC) configuration, including subnets, route tables, internet gateways, and NAT gateways. This ensures that the ECS cluster has the necessary network infrastructure to operate securely and efficiently.
- **ec2.tf**: Manages the EC2 instances that will serve as the container instances for the ECS cluster. This includes configurations for instance types, Auto Scaling groups, and security groups to ensure the instances are properly provisioned and secured.
 

### Future Scope: Integrating ArgoCD

In the future, integrating ArgoCD into the HaalSamachar infrastructure can significantly enhance the deployment process by enabling GitOps workflows. This integration would involve:

1. **Setting Up ArgoCD**: Deploying ArgoCD to the Kubernetes cluster to manage the deployment of applications from git repositories.
2. **Application Configuration**: Creating ArgoCD Application manifests that point to the HaalSamachar git repositories, specifying the paths to Kubernetes manifests.
3. **Sync Policies**: Defining sync policies in ArgoCD to automate deployments and rollbacks based on changes in the git repository.
4. **Monitoring and Alerts**: Configuring monitoring and alerting within ArgoCD to track deployment status and issues.

Integrating ArgoCD would streamline continuous deployment, ensure consistency across environments, and improve rollback capabilities.

## Contributing

We welcome contributions to the HaalSamachar Infrastructure Repository! To contribute:

1. **Fork the Repository**: Create a personal fork of the repository on GitHub.
2. **Clone the Repository**: Clone your forked repository to your local machine.
3. **Create a Branch**: Create a new branch for your feature or bugfix.
4. **Make Changes**: Implement your changes and ensure they are well-documented and tested.
5. **Commit and Push**: Commit your changes to your branch and push them to your forked repository.
6. **Create a Pull Request**: Open a pull request against the main repository, describing your changes in detail.

Please ensure your contributions adhere to our coding standards and guidelines. Review the [CONTRIBUTING.md](link-to-contributing-guide) for detailed instructions.

## License

The HaalSamachar Infrastructure Repository is licensed under the [MIT License](LICENSE). This license permits you to use, modify, and distribute the code with proper attribution. For more details, refer to the LICENSE file included in the repository.
