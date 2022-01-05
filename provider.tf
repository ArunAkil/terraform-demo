// Configure the Google Cloud provider
provider "google" {
    credentials = file("terraform-gcp.json")
 project     = "lunar-reef-336905"
 region      = "asian-south1"
}