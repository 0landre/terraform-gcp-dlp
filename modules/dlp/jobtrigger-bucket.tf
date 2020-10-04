resource "google_data_loss_prevention_job_trigger" "basic-bucket-job" {
    parent          = "projects/${var.project}"
    description     = "Reoccuring search on 'special-data' bucket"
    display_name    = "Special-Data Bucket Job"

    triggers {
        schedule {
            recurrence_period_duration = var.dlp_job_trigger_schedule
        }
    }

    inspect_job {
        inspect_template_name = google_data_loss_prevention_inspect_template.basic.id
        actions {
            save_findings {
                output_config {
                    table {
                        project_id = var.project
                        dataset_id = split("/", var.bq_output_dataset_id)[3]
                    }
                }
            }
        }
        storage_config {
            cloud_storage_options {
                file_set {
                    url = var.cloudstorage_input_storage_url
                }
                file_types = ["TEXT_FILE", "PDF"]
            }
        }
    }
}
