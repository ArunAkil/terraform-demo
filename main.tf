resource "google_service_account" "myaccount" {
  account_id   = "myaccount"
  display_name = "My Service Account"
}

resource "google_compute_instance" "vm-instance1" {
  name         = "vm-instance"
  machine_type = "e2-medium"
  hostname     = "vm-instance.com"
  zone         = "asian-south1-c"
  allow_stopping_for_update = true

  #tags = ["foo", "bar"]

  labels = {
    name  = "vm-instance"
    owner = "arunkumar"
    user  = "arun"
    dept  = "devops"
    os    = "ubuntu20.04"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu20.04"
    }
  }

  /*// Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }*/

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "terraform-automation@lunar-reef-336905.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}