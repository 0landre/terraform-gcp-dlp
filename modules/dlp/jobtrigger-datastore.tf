resource "google_data_loss_prevention_job_trigger" "basic-datastore-job" {
    parent          = "projects/${var.project}"
    description     = "Reoccuring search on 'sample' datastore table"
    display_name    = "Sample Datastore Job"

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
            datastore_options {
                partition_id {
                    project_id = var.project
                }
                kind {
                  name = var.datastore_input_kind
                }
            }
        }
    }
}
