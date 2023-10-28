
resource "proxmox_vm_qemu" "cloudinit-test" {
    name = "terraform-test-vm"
    desc = "A test for using terraform and cloudinit"
    vmid = "175"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "hq-pve-01"

    # The destination resource pool for the new VM
 #   pool = "pool0"

    # The template name to clone this vm from
    clone = "oSuse-15-cloud-init"
    full_clone = true

    # Activate QEMU agent for this VM
    agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048
    scsihw = "virtio-scsi-single"
   

    # Setup the disk
    disk {
        storage = "ibmv3700"
        type = "virtio"
        size = "24G"
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        model = "virtio"
        bridge = "VL1337"
    #    tag = 256
    }

}
