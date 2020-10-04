provider "google" {
  project     =  "{REPLACE_WITH_YOUR_PROJECT}"
}

terraform {
  backend "gcs" {
    bucket  = "{REPLACE_WITH_YOUR_UNIQUE_BUCKET}"
    prefix  = "terraform/state"
  }
}

// 1. Service account(s)
module "iam" {
  source                              = "./modules/iam"
}

// 2a. Storage bucket (DLP source input #1)
module "storage_input" {
  source                              = "./modules/dlp_input_sources/cloudstorage"
  cloudstorage_input_bucket_name      = var.cloudstorage_input_bucket_name
  cloudstorage_input_bucket_location  = var.location
  unique_label_id                     = var.unique_label
}

// 2b. BQ table (DLP source input #2)
module "bigquery_input" {
  source                              = "./modules/dlp_input_sources/bigquery"
  bq_dataset_id                       = var.input_bq_dataset_id
  bq_dataset_location                 = var.location
  bq_table_id                         = var.input_bq_table_id
  unique_label_id                     = var.unique_label
}

// 2c. Datastore table indexes (DLP source input #3)
module "datastore_input" {
  source                              = "./modules/dlp_input_sources/datastore"
  datastore_kind                      = var.datastore_input_kind
}

// 3. DLP output config
module "bigquery_output" {
  source                              = "./modules/bigquery"
  bq_dataset_id                       = var.output_bq_dataset_id
  bq_dataset_location                 = var.location
  bq_dlp_owner                        = module.iam.bq_serviceaccount
  unique_label_id                     = var.unique_label
}

// 4. DLP... finally
module "dlp" {
  source                              = "./modules/dlp"
  project                             = var.project
  dlp_job_trigger_schedule            = var.dlp_job_trigger_schedule
  bq_output_dataset_id                = module.bigquery_output.bq_dataset_id
  bq_input_dataset_id                 = module.bigquery_input.bq_dataset_id
  bq_input_table_id                   = module.bigquery_input.bg_table_id
  cloudstorage_input_storage_url      = module.storage_input.cloudstorage_bucket
  datastore_input_kind                = var.datastore_input_kind
}