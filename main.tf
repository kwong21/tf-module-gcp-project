data "google_service_account" "terraform" {
  account_id = "terraform"
  project    = "terraform-admin-deephalf"
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  org_id          = var.org_id

  labels = {
    "managed_by" = "terraform"
  }
}

resource "google_project_iam_binding" "project" {
  project = google_project.project.project_id
  role    = "roles/owner"

  members = [
    "group:ops@deephalf.ca",
    "serviceAccount:${data.google_service_account.terraform.email}"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(var.services_list)

  service            = each.key
  project            = google_project.project.project_id
  disable_on_destroy = false
}

resource "google_compute_project_metadata" "oslogin" {
  project = random_id.id.hex

  metadata = {
    enable-oslogin = "TRUE"
  }
}
