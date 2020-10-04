resource "google_bigquery_dataset" "output_dataset" {
  dataset_id                  = var.bq_dataset_id
  friendly_name               = var.bq_dataset_id
  description                 = "Dataset DLP Findings"
  location                    = var.bq_dataset_location
  default_table_expiration_ms = 3600000

  labels = {
    env         = "default"
    automation  = "true"
    id          = var.unique_label_id
  }

  access {
    role          = "OWNER"
    user_by_email = var.bq_dlp_owner
  }
}
