variable "toplevel_domain" { }

variable "force_destroy" {
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  default     = false
}

variable "vpc_id" {
  description = "associate the zone with this VPC ID. !!! IMPORTANT !!! setting this will make the zone private"
  default     = ""
}

variable "zone_comment" {
  description = "add a useful comment to your zone"
  default     = "Managed with Terragrunt"
}

variable "tags" {
  type = "map"
  default = {}
}

variable "region" {
  type = "string"
  description = "aws region"
}

variable "a_records" { 
  type = "list" 
  default = [] 
}

variable "a_record_addresses" {
  type = "list"
  default = []
}

variable "cname_records" { 
  type = "list" 
  default = [] 
}

variable "cname_record_addresses" {
  type = "list"
  default = []
}

variable "ttl" {
  type = "string"
  default = "60"
}
