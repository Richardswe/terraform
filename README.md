# Terraform
Different Terraform scripts that I've made :) 

- Create VM in Proxmox
- Create network and k8s-cluster in OpenStack with the use of Magnum. 


github: https://github.com/richardswe

## Platforms
------------------
OpenStack
In this case i used Binero.
And Proxmox to provision VM's :) 
-------------------

# Create Cluster
1. First make sure you have setup Terraform properly installed on your local machine. 
2. Get your credential from you OpenStack provider, you will be asked to use them when running the Terraform plan.
3. Due to some issues with the labels for the k8s template. Run the cli command

Openstack commands

# Different OpenStack commands
## List flavors
```bash
openstack flavor list
```
## List internal or external networks
```bash
openstack network list --internal  
```

## List images
```bash
openstack image list
```

## List subnets
```bash
openstack subnet list
```

## List availability zones
```bash
openstack availability zone list
```
----------
Kubeconfig
Connect to your cluster
----------
To be able to connect to your newly created cluster, can we download the kube-config file from Horizon/Binero portal. 
1. Go in under CONTAINER INFRA, choose Cluster and then hover over to the right of the cluster you want to connect to, to the right choose more and then hämta certifcat. 
2. Download it and place it under /home/youruser/.kube/
Be sure to save your other kube-config files and make backups of them. 


Author Information
------------------
[Rickard Andersson](https://github.com/richardswe)


