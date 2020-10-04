resource "google_bigquery_dataset" "source_dataset" {
  dataset_id                  = var.bq_dataset_id
  friendly_name               = var.bq_dataset_id
  description                 = "Input BQ Dataset"
  location                    = var.bq_dataset_location
  default_table_expiration_ms = 3600000

  labels = {
    env         = "default"
    automation  = "true"
    id          = var.unique_label_id
  }
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.source_dataset.dataset_id
  table_id   = var.bq_table_id

  time_partitioning {
    type = "DAY"
  }

  labels = {
    env = "default"
    automation = "true"
  }

  schema = <<EOF
[
  {
    "name": "phone",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "Phone number"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF
}