# vm-names
variable "name-vm-1" {
    string = ""
    default = "k8s-m0"
}
variable "name-vm-2" {
    string = ""
    default = "k8s-m1"
}
variable "name-vm-3" {
    string = ""
    default = "k8s-m2"
}
variable "name-vm-4" {
    string = ""
    default = "k8s-w1"
}
# Description
variable "desc-k8s-server" {
    string  = ""
    default = "k8s-server"
}
# VMID's 
variable "" {
    string  = ""
    default = ""
}
variable "" {
    string  = ""
    default = ""
}
variable "" {
    string = ""
    default = ""
}
variable "" {
    string = ""
    default = ""
}
# Proxmox nodes
variable "proxmox-01" {
    string = ""
    default = "pve-01"
}
variable "" {
    string = ""
    default = ""
}
variable "" {
    string = ""
    default = ""
}
# Proxmox OS-template
variable "template" {
    string = ""
    default = "oSuse-15-cloud-init"
}
# Proxmox Storage-box
variable "storage-box" {
    string = ""
    default = "ibm-storage"
}
# Network configurations; Vlan
variable "vlan-name" {
    string = "" 
    default = "VL10"
}

