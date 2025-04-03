#
# Copyright (c) 2022 by Delphix. All rights reserved.
#

output "instance_id" {
  value = aws_instance.instance.id
}

output "instance_ip" {
  value = aws_instance.instance.private_ip
}

output "instance_dns_name" {
  value = var.hosted_zone != "" ? "${var.instance_name}.${var.hosted_zone}" : ""
  description = "The DNS name of the instance in Route 53"
}
