resource "google_data_loss_prevention_job_trigger" "basic-bq-job" {
    parent          = "projects/${var.project}"
    description     = "Reoccuring search on 'sample' bq table"
    display_name    = "Sample BQ Job"

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
            big_query_options {
                table_reference {
                    project_id = var.project
                    dataset_id = split("/", var.bq_input_dataset_id)[3]
                    # Error creating JobTrigger: googleapi: Error 400: table_id "projects/my-project/datasets/my_bq_dataset/tables/my_bq_table" is malformed.
                    # table_id = var.bq_input_table_id
                    table_id = split("/", var.bq_input_table_id)[5]
                }
            }
        }
    }
}
