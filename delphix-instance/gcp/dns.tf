
locals {
  instance_host_name = var.hosted_zone != "" ? "${var.instance_name}.${data.google_dns_managed_zone.dns_zone.dns_name}" : ""
}

data "google_dns_managed_zone" "dns_zone" {
  count = var.hosted_zone != "" ? 1 : 0
  name  = var.hosted_zone
}

resource "google_dns_record_set" "dns_a_record" {
  count        = var.hosted_zone != "" ? 1 : 0
  managed_zone = data.google_dns_managed_zone.dns_zone[0].name
  name         = local.instance_host_name
  type         = "A"
  ttl          = 300
  rrdatas      = [google_compute_instance.instance.network_interface[0].network_ip]
}

resource "google_dns_record_set" "dns_txt_record" {
  count        = var.hosted_zone != "" ? 1 : 0
  managed_zone = data.google_dns_managed_zone.dns_zone[0].name
  name         = local.instance_host_name
  type         = "TXT"
  ttl          = 300
  rrdatas      = ["{\"name\": \"${var.instance_name}\",\"user\": \"${var.owner}\"}"]
}