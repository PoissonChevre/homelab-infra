# Terraform provider plugin for Proxmox
# https://github.com/Telmate/terraform-provider-proxmox
# pve1 ==> user:terraform => group: TerraformProvision 
# => role: TerraformProvision & atttribute the to the user terraform

/*
pveum role modify TerraformProvision -privs "Datastore.AllocateSpace Datasto
re.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.All
ocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk 
VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Power
Mgmt VM.GuestAgent.Audit SDN.Use"
*/

resource "proxmox_qemu" "srv_demo1" {
  name        = var.vm_name
  target_node = var.proxmox_node
  clone       = var.vm_template
  cores       = var.vm_cores
  memory      = var.vm_memory
  agent       = var.vm_agent

  disk {
    size = var.vm_disk_size
    type = "scsi"
  }
  network {
    model = "virtio"
    bridge = var.proxmox_bridge
  }
}