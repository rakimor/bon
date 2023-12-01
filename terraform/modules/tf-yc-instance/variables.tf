variable "vm_name" {
    default  = "bingo"
    type     = string
    nullable = false
}

variable "vm_platform_id" {
    default  = "standard-v1"
    type     = string
}

variable "vm_zone" {
    default  = "ru-central1-b"
    type     = string
}

variable "vm_subnet_id" {
    default = "e2lkqgue0p8vs60f5d83"
    type    = string 
}

variable "vm_image_id" {
    default  = "fd89cudngj3s2osr228p"
    type     = string
    nullable = false
}

variable "vm_disk_size" {
    default = 18
    type    = number

}

variable "vm_preemptible" {
    default = true
    type    = bool
}

variable "vm_name_suffixes" {
    default = ["1"]
    type     = list
    nullable = false
}
