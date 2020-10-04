resource "google_storage_bucket" "special-data-logging" {
  name          = "${var.cloudstorage_input_bucket_name}-logging"
  location      = var.cloudstorage_input_bucket_location
  force_destroy = false

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = "20"
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    env         = "default"
    automation  = "true"
    id          = var.unique_label_id
  }
}

resource "google_storage_bucket" "special-data" {
  name          = var.cloudstorage_input_bucket_name
  location      = var.cloudstorage_input_bucket_location
  force_destroy = false

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = "10"
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    env         = "default"
    automation  = "true"
    id          = var.unique_label_id
  }

  logging {
    log_bucket = "${var.cloudstorage_input_bucket_name}-logging"
  }
}
