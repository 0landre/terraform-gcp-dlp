variable "project" {
  default = "{REPLACE_WITH_YOUR_PROJECT}"
}

variable "location" {
  default = "US"
}

variable "unique_label" {
  default = "aUtOmAtIoN 1"
}

variable "dlp_job_trigger_schedule" {
  description = "How frequent DLP trigger should run"
  default = "604800s" /* 1 week */
}

variable "cloudstorage_input_bucket_name" {
  default = "my-bucket-abc"
}

variable "input_bq_dataset_id" {
  default = "my_bq_dataset"
}

variable "input_bq_table_id" {
  default = "my_bq_table"
}

variable "datastore_input_kind" {
  default = "person"
}

variable "output_bq_dataset_id" {
  default = "my_dlp_output_dataset"
}