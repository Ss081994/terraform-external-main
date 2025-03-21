resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false  # Disable auto subnet creation
}

# Create Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
}


resource "google_compute_firewall" "allow_iap_ssh" {
  name    = "allow-iap-ssh"
  network = google_compute_network.vpc_network.id # Or your custom VPC network name

  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["35.235.240.0/20"] # Google IAP proxy IP range
  target_tags   = ["delphix-engine"]     # Only applies to VMs with this tag

  description = "Allow IAP to SSH into VMs with tag 'iap-enabled'"
}





