output "ip_address" {
    value = join(", ", yandex_compute_instance.vm-1[*].network_interface.0.ip_address)
}

output "ip_external_address" {
    value = join(", ", yandex_compute_instance.vm-1[*].network_interface.0.nat_ip_address)   
}
