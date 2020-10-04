variable "project" {
  description = "GCP Project"
}

variable "dlp_job_trigger_schedule" {
  description = "How frequent DLP trigger should run"
  default = "604800s" 
}

variable "bq_output_dataset_id" {
  description = "Big query dataset id of dlp output results"
}

variable "bq_input_dataset_id" {
  description = "Big query dataset id of source"
}

variable "bq_input_table_id" {
  description = "Big query table id of source"
}

variable "cloudstorage_input_storage_url" {
  description = "Cloudstorage location for input bucket"
}

variable "datastore_input_kind" {
  description = "Datastore 'kind' to look for"
}