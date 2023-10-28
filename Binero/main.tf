# Creating the network for the cluster
###############################################################
resource "openstack_networking_network_v2" "private-network-2" {
  name           = "private-network-2"
  admin_state_up = "true"
  port_security_enabled = "true"
}

resource "openstack_networking_subnet_v2" "private-subnet_2" {
  name = "private-subnet_2"
  network_id = "${openstack_networking_network_v2.private-network-2.id}"
  cidr       = "10.10.1.0/26"
  gateway_ip = "10.10.1.1"
  ip_version = 4
  dns_nameservers = ["8.8.8.8"]

  allocation_pool {
    end   = "10.10.1.62"
    start = "10.10.1.30" 
  }
}
resource "openstack_networking_router_v2" "router-2" {
  name           = "router-2"
  admin_state_up = "true"
  external_network_id = "35164b56-13a1-4b06-b0e7-94c9a67fef7e"
}

resource "openstack_networking_router_interface_v2" "router_interface_2" {
  router_id = "${openstack_networking_router_v2.router-2.id}"
  subnet_id = "${openstack_networking_subnet_v2.private-subnet_2.id}"
}

# Importing SSH-key
################################################################
resource "openstack_compute_keypair_v2" "ssh-key-2" {
  name       = "ssh-key-2"
  public_key = "YOUR PUBLIC KEY"
}

# Creating the k8s template
# ###############################################################
resource "openstack_containerinfra_clustertemplate_v1" "k8s-template_2" {
  region	        = "europe-se-1"
  name                  = "k8s-template_2"
  image                 = "1a5ddccd-df97-4374-b946-762b40dfe11a"
  coe                   = "kubernetes"
  flavor                = "61f3f889-9ec3-4b75-8197-c4b9ba9f4821"
  master_flavor         = "20b79442-1dbf-4a85-b783-8eec077c17dc"
  dns_nameserver        = "8.8.8.8"
  docker_storage_driver = "overlay2"
  docker_volume_size    = 20
  volume_driver         = "cinder"
  network_driver        = "flannel"
  server_type           = "vm"
  master_lb_enabled     = true
  floating_ip_enabled   = true
  external_network_id   = "35164b56-13a1-4b06-b0e7-94c9a67fef7e"
  fixed_network	      	= "${openstack_networking_network_v2.private-network-2.id}"
  fixed_subnet		= "${openstack_networking_subnet_v2.private-subnet_2.id}"
  keypair_id            = "ssh-key-2"
}

