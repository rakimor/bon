module "instance" {
  source = "./modules/tf-yc-instance"
  vm_zone = var.zone
  vm_name = var.name
  vm_name_suffixes = var.name_suffixes
  vm_subnet_id =  var.subnet_id
  vm_image_id = var.image_id
}

resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/templates/inventory.tpl",
    {
      bingo_ip = module.instance.ip_external_address
    }
  )
  filename = "../ansible/inventory/inventory.yaml"
}