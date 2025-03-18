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
    network    = var.network
    subnetwork = var.subnet
    access_config {}
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}