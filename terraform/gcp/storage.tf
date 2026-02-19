resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "bucket" {
  name          = "dorian-terraform-bucket-${random_id.bucket_suffix.hex}"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "text_file" {
  name   = "sample.txt"
  source = "sample.txt"
  bucket = google_storage_bucket.bucket.name
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}
