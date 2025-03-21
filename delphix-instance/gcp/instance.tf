resource "google_compute_instance" "instance" {
  name         = var.instance_name
  machine_type = var.instance_size
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image_id
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.subnet.id
  }
  
  tags = ["delphix-engine"]

  metadata = {
    owner   = var.owner
    creator = var.creator
    enable-os-login = "true"
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}
