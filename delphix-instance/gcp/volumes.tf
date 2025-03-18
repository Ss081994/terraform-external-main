resource "google_compute_disk" "data_disk" {
  for_each = var.data_disks

  name  = "${var.instance_name}-disk-${each.key}"
  type  = each.value.type
  size  = each.value.size
  zone  = var.zone
  iops  = each.value.iops
}

resource "google_compute_attached_disk" "data_disk_attachment" {
  for_each = var.data_disks

  instance = google_compute_instance.instance.id
  disk     = google_compute_disk.data_disk[each.key].id
}