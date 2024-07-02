

## 1. Kubernetes on Proxmox cluster

Kubernetes on Proxmox cluster. It is my DevOps course project for Code Academy learnings.

## 2. Project Description

This is an important component of your project that many new developers often overlook.

Your description is an extremely important aspect of your project. A well-crafted description allows you to show off your work to other developers as well as potential employers.

The quality of a README description often differentiates a good project from a bad project. A good one takes advantage of the opportunity to explain and showcase:

    What your application does,
    Why you used the technologies you used,
    Some of the challenges you faced and features you hope to implement in the future.

## 3. Table of Contents (Optional)

If your README is very long, you might want to add a table of contents to make it easy for users to navigate to different sections easily. It will make it easier for readers to move around the project with ease.
## 4. How to Install and Run the Project

If you are working on a project that a user needs to install or run locally in a machine like a "POS", you should include the steps required to install your project and also the required dependencies if any.

Provide a step-by-step description of how to get the development environment set and running.
## 5. GitHub Actions Secrets Configuration

| Secret Name            | Description                                       |
|------------------------|---------------------------------------------------|
| REGISTRY_URL           | URL of the Docker registry                        |
| REGISTRY_USERNAME      | Docker registry username                          |
| REGISTRY_PASSWORD      | Docker registry password                          |
| KUBECONFIG             | Base64 encoded kubeconfig file content            |
| VAULT_PASSWORD_FILE    | Base64 encoded Ansible Vault password file content|
| PROXMOX_API_TOKEN_ID   | Proxmox API token ID                              |
| PROXMOX_API_TOKEN_SECRET| Proxmox API token secret                         |
| PROXMOX_API_USER       | Proxmox API user                                  |
| SSH_PRIVATE_KEY        | SSH private key                                   |
| TAILSCALE_AUTHKEY      | Tailscale authentication key                      |
| VMPASS                 | Virtual machine password                          |


Also if your project will require authentication like passwords or usernames, this is a good section to include the credentials.
## 6. Include Credits

If you worked on the project as a team or an organization, list your collaborators/team members. You should also include links to their GitHub profiles and social media too.

Also, if you followed tutorials or referenced a certain material that might help the user to build that particular project, include links to those here as well.

This is just a way to show your appreciation and also to help others get a first hand copy of the project.
## 7. Add a License



## 8. Usefull commands

To see your current cluster configuration: kubectl config view --minify --raw

