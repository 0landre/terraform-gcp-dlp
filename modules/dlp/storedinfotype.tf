# NOTE: This is NOT used anywhere in the TF configuration See 'inspecttemplate.tf'
resource "google_data_loss_prevention_stored_info_type" "basic" {
    parent        = "projects/${var.project}"
    description   = "Simple regex matching info type"
    display_name  = "Secret Keyword"

    regex {
        pattern = "SECRET"
    }
}
