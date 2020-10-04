resource "google_data_loss_prevention_inspect_template" "basic" {
    parent          = "projects/${var.project}"
    description     = "Basic user data identification"
    display_name    = "Basic User Data"

    inspect_config {
        info_types {
            name = "EMAIL_ADDRESS"
        }
        info_types {
            name = "PERSON_NAME"
        }
        info_types {
            name = "PHONE_NUMBER"
        }
        # Can't associate the stored infotype with custom infotype, no TF option for this
        # will get error if try to try to access from any of the attributes on stored infotype
        # The option is configurable from the UI however (Custom - Stored Info Type)
        # Error: Error creating InspectTemplate: googleapi: Error 400: 
        #info_types {
        #    name = google_data_loss_prevention_stored_info_type.basic.name
        #    name = google_data_loss_prevention_stored_info_type.basic.id
        #}

        min_likelihood = "LIKELY"
        rule_set {
            info_types {
                name = "EMAIL_ADDRESS"
            }
            rules {
                exclusion_rule {
                    regex {
                        pattern = ".+@example.com"
                    }
                    matching_type = "MATCHING_TYPE_FULL_MATCH"
                }
            }
        }

        limits {
            max_findings_per_item    = 3
            max_findings_per_request = 12
        }
    }
}
