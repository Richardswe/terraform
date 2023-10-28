# Configure the OpenStack Provider
 provider "openstack" {
  user_name     = ""
  tenant_name   = ""
  password      = ""
  auth_url      = "https://auth.binero.cloud:5000/v3"
  region        = "europe-se-1"
  endpoint_type = "public"
}

terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      version = "1.47.0"
    }
  }
}
