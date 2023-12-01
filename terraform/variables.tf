variable "zone" {
    default = "ru-central1-b"
    type = string
    nullable = false
}

variable "cloud_id" {
    default = "b1ganv6usq3pb8mcglja"
    type = string
    nullable = false
}

variable "folder_id" {
    default = "b1g3p5h4keke1q290oj9"
    type = string
    nullable = false
}

variable "subnet_id" {
    default = "e2lkqgue0p8vs60f5d83"
    type = string
    nullable = false
}
variable "image_id" {
    default = "fd89cudngj3s2osr228p" 
    type = string
    nullable = false
}

variable "name" {
    default  = "bingo"
    type     = string
    nullable = false
}

variable "name_suffixes" {
    default = ["bongo"]
    type    = list
}

