variable "bq_dataset_id" {
  description = "The ID of the BQ dataset"
}

variable "bq_dataset_location" {
  description = "The location of the BQ dataset"
  default     = "US"
}

variable "bq_table_id" {
  description = "Bigquery table"
  default     = "sample"
}

variable "unique_label_id" {
  description = "Generic label id"
}