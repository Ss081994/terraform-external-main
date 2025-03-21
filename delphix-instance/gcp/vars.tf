variable "data_disks" {
  description = "Map of data disks to create and attach to instance"
  type = map(
    object({
      size = number
      type = string
      iops = number
  }))
  default = {
    "disk-1" : {
      "size" : 8
      "type" : "pd-balanced"
      "iops" : null
    },
    "disk-2" : {
      "size" : 8
      "type" : "pd-balanced"
      "iops" : null
    },
    "disk-3" : {
      "size" : 8
      "type" : "pd-balanced"
      "iops" : null
    }
  }
}

variable "instance_name" {
  description = "Name of the new instance"
  type        = string
}

variable "image_id" {
  description = "Image ID used for main instance"
  type        = string
}
variable "project_id" {
  description = "Project id  to run the project on"
  type        = string
}

variable "instance_size" {
  description = "GCP instance machine type"
  type        = string
  default     = "n2-standard-2"
}

variable "service_account_email" {
  description = "Service account email for the instance"
  type        = string
}

variable "creator" {
  description = "Instance creator, used for tagging"
  type        = string
}

variable "owner" {
  description = "Instance owner, used for tagging"
  type        = string
}

variable "hosted_zone" {
  description = "Hosted zone name to create a DNS record in"
  type        = string
  default     = ""
}

variable "subnet_name" {
  description = "GCP subnet name for the instance"
  type        = string
  default     = "my-custom-subnet" 
}

variable "zone" {
  description = "GCP availability zone for the instance"
  type        = string
}

variable "tags" {
  description = "Map of tags to tag all resources with"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "my-custom-vpc"
}

variable "subnet_cidr" {
  description = "Subnet CIDR Block"
  type        = string
  default     = "10.18.18.0/24"
}

