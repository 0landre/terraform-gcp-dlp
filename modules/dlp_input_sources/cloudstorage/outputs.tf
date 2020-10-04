output "cloudstorage_bucket" {
  value = "${google_storage_bucket.special-data.url}"
}