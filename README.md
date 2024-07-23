

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

### Step 3: Configure Ansible Inventory and Variables

Edit the ansible/inventory/.ansible_inventory and ansible/inventory/variables.yml file to match your infrastructure:

    
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

## 4. Playbooks and Roles

The automation process is divided into several playbooks, each performing specific tasks to set up the Kubernetes cluster on ProxMox. Here’s a step-by-step breakdown of what each playbook does and the roles they execute:
### 1. Playbook: infrastructure.yml

This playbook prepares the ProxMox environment and sets up the initial infrastructure.
Roles Executed:

    prepare-infra:
        Updates the Proxmox environment on all nodes.
        Lists and deletes existing VMs except for the specified one.

    create_VM_template:
        Checks if the VM template already exists.
        Downloads the Ubuntu cloud image and sets up the VM on ProxMox.
        Configures the VM and converts it into a template.

    create_VMs:
        Clones VMs from the created template.
        Migrates the cloned VMs to different nodes.
        Starts the VMs after migration.

### 2. Playbook: install_kubernetes.yml

This playbook installs and configures Kubernetes components on the prepared infrastructure.
Roles Executed:

    prepare-nodes:
        Enables IPv4 and IPv6 forwarding necessary for Kubernetes networking.

    rke2-download:
        Creates a directory and downloads the RKE2 binary.

    kube-vip:
        Sets up Kube-VIP for high availability on master nodes by creating necessary directories and deploying configuration files.

    rke2-prepare:
        Configures systemd services for RKE2 server and agent.
        Ensures the RKE2 server is running and fetches the node token for adding other nodes to the cluster.

    add-server:
        Configures and ensures additional RKE2 server nodes are running and part of the cluster.

    add-agent:
        Configures and ensures RKE2 agents (worker nodes) are running and part of the cluster.

    apply-manifests:
        Waits for Kubernetes nodes to be ready.
        Sets up MetalLB for load balancing by applying necessary manifests and configurations.

### 3. Playbook: deployment.yml

This playbook sets up monitoring and management tools on the Kubernetes cluster.
Roles Executed:

    prepare-monitoring:
        Checks and installs Helm if not present.
        Adds Prometheus Helm repository and updates it.
        Deploys Prometheus and Grafana for monitoring the Kubernetes cluster.

    portainer:
        Ensures Python 3 and Kubernetes Python library are installed.
        Sets up StorageClass and Persistent Volume for Portainer.
        Installs Portainer using Helm package manager.


## 5. Usage
Running the Workflow

Trigger the GitHub Actions workflow by pushing changes to the main branch or creating a pull request:


    git add .
    git commit -m "Initial setup"
    git push origin main


## 6. Usefull commands

  To see your current cluster configuration:
   
    kubectl config view --minify --raw

