output "bq_serviceaccount" {
  value = "${google_service_account.dlp-bq-output-owner.email}"
}