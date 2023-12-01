resource "yandex_compute_instance" "vm-1" {
    count = length(var.vm_name_suffixes)
    name = "${var.vm_name}-${element(var.vm_name_suffixes, count.index)}"
    platform_id = var.vm_platform_id
    zone = var.vm_zone

    resources {
        core_fraction = 20
        cores  = 2
        memory = 4
    }

    boot_disk {
        initialize_params {
            image_id = var.vm_image_id
            size = var.vm_disk_size
        }
    }

    network_interface {
        subnet_id = var.vm_subnet_id
        nat       = true
    }

    metadata = {
        user-data = "${file("${path.module}/scripts/cloud-init.yaml")}"
    }

    scheduling_policy {
        preemptible = false
    }
}
