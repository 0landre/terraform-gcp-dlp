data "google_iam_policy" "sa-user" {
  binding {
    role = "roles/iam.serviceAccountUser"

    members = [
      "allAuthenticatedUsers"
    ]
  }
}

resource "google_service_account" "dlp-bq-output-owner" {
  account_id    = var.sa_id
  display_name  = "Service Account for DLP output results in BQ"
}

resource "google_service_account_iam_policy" "sa-iam" {
  service_account_id = google_service_account.dlp-bq-output-owner.name
  policy_data        = data.google_iam_policy.sa-user.policy_data
}
