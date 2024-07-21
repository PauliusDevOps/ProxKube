

## 1. Kubernetes on ProxMox cluster

It's my DevOps course project for Code Academy learnings.

## 2. Prerequisites

Before you begin, ensure you have met the following requirements:
- Proxmox VE installed and accessible
- Tailscale account and authentication key
- SSH access to all nodes
- Kubernetes knowledge

## 3. Installation

Follow these steps to install and configure ProxKube:

### Step 1: Clone the Repository

    git clone https://github.com/PauliusDevOps/ProxKube.git
    cd ProxKube

### Step 2: Set Up GitHub Secrets

In your GitHub repository, go to Settings > Secrets and add the following secrets:

    TAILSCALE_AUTHKEY: Your Tailscale authentication key
    SSH_PRIVATE_KEY: Private SSH key for accessing your nodes
    PROXMOX_API_USER: Proxmox API user
    PROXMOX_API_TOKEN_ID: Proxmox API token ID
    PROXMOX_API_TOKEN_SECRET: Proxmox API token secret

### Step 3: Configure Ansible Inventory

Edit the ansible/inventory/.ansible_inventory file to match your infrastructure:

    
    [nodes]
    ipa ansible_host=192.168.1.115 ansible_user=root
    lager ansible_host=192.168.1.116 ansible_user=root
    ale ansible_host=192.168.1.117 ansible_user=root
    
    [main-node]
    ipa ansible_host=192.168.1.115 ansible_user=root
    
    [masters]
    master1 ansible_host=192.168.1.170 ansible_user=pk
    master2 ansible_host=192.168.1.171 ansible_user=pk
    master3 ansible_host=192.168.1.172 ansible_user=pk
    							   
    [workers]                      
    worker1 ansible_host=192.168.1.173 ansible_user=pk
    worker2 ansible_host=192.168.1.174 ansible_user=pk
    worker3 ansible_host=192.168.1.175 ansible_user=pk

### Step 4: Install Ansible Collections


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

  To see your current cluster configuration:
   
    kubectl config view --minify --raw

