resource "proxmox_vm_qemu" "pike" {
  name        = "pike.blazcata.cz"
  desc        = "Test VM"
  target_node = var.PROXMOX_NODE1
  pool        = "Test"

  clone   = "Ubuntu2204LTS"
  os_type = "cloud-init"
  scsihw  = "virtio-scsi-single" # virtio-scsi-pci for multiple disks
  qemu_os = "l26"
  ciuser  = "homelab"
  sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOTm0wfJpY+JLZ7qIBGYjQxx5YqLL0VkBiXg8ZZxQ6yqD7YBfVNJXT1zxOvf6unUTB0Ur+R2RFXDP8/hJdyDhHpoyv2IcvBYOsk91xjU7HzKsqLgS+9Tf+QUIUCHK/7orXMjP8VUCw6DRZr50TTD2om9GwdKyJOXFiSypClPp6T25Qld036dNVyyYvYKVLdbP5ADgtLRigv4xK6MXHhf6fFQqvdNaB6eBvcupL3ijXZ5LiWliwcRaqUy6RRSulTSRFrN9EfxCEdcy4D4RNJuxlPzX96fV3ZmeLBx7K6EPRLFSXyrKuom9omO9Dcd7Mt5Y4QIpXc6iW7RccAXGE4s8UiGceyqItjRRaMlLi+yQn+VNeApnwvXGQLTDrsh45Nfc/TNlvP37xH3cSmNH8GwYJ+W6eapCzeA7tsAZo1F9wRYzgqk2GpFaUb/y2bREWf0WLPsw8REmCpEZ0+KkVcT7UD34uD5imXlVkHvvxYMpxuBDbaOPcVLqDEbaH7G3TySM= ladislav@lblazek.cz"

  cores     = 2
  sockets   = 1
  memory    = 2048
  ipconfig0 = "ip=10.10.30.15/24,gw=10.10.30.1"

  disk {
    type    = "scsi"
    storage = "local-lvm"
    ssd     = 1
    size    = "32G"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 30
  }
}

resource "routeros_ip_dns_record" "pike" {
  name    = "pike.blazcata.cz"
  address = "10.10.30.15"
  type    = "A"
  ttl     = "1h"
  comment = "TF"
}
