

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

## 4. Usage
Running the Workflow

Trigger the GitHub Actions workflow by pushing changes to the main branch or creating a pull request:


    git add .
    git commit -m "Initial setup"
    git push origin main


## 5. Usefull commands

  To see your current cluster configuration:
   
    kubectl config view --minify --raw

