output "bq_dataset_id" {
  value = "${google_bigquery_dataset.output_dataset.id}"
}