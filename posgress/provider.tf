provider "google" {
  credentials = "${file("/home/sravangcp/gcp-key.json")}"
  project     = "dolphine-project"
}
