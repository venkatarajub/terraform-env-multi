variable "instances" {
  type        = map
  
}

variable "common_tags" {
    default = {
        project = "expense"
        terraform =  "true"
    }
}

variable "tags" {

}

variable "environment" {

}

variable "zone_id" {
    default = "Z07511293FMH2POOUP6DK"
}

variable "domain_name" {
    default = "vensa.online"
}