output "iap_tunnel_command" {
  description = "Command to start IAP tunnel to access the Delphix UI"
  value       = "gcloud compute start-iap-tunnel ${google_compute_instance.delphix.name} 8000 --zone=${var.zone} --local-host-port=localhost:8000"
}
