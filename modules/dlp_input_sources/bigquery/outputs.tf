output "bq_dataset_id" {
  value = "${google_bigquery_dataset.source_dataset.id}"
}

output "bg_table_id" {
  value = "${google_bigquery_table.default.id}"
}