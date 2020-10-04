resource "google_datastore_index" "person" {
  kind = var.datastore_kind
  properties {
    name = "name"
    direction = "ASCENDING"
  }
  properties {
    name = "email"
    direction = "ASCENDING"
  }
  properties {
    name = "phone"
    direction = "ASCENDING"
  }
  properties {
    name = "dob"
    direction = "ASCENDING"
  }
  properties {
    name = "company"
    direction = "ASCENDING"
  }
}
