
variable "project_name" {}
variable "billing_account" {}
variable "org_id" {}
variable "region" {}

Terraform resources used:

/* provider "google": The Google cloud provider config. The credentials will be pulled using the GOOGLE_APPLICATION_CREDENTIALS environment variable, set earlier in this tutorial. */

provider "google" {
  region = var.region
}

/* resource "random_id": Project IDs must be unique. Generate a random one prefixed by the desired project ID
*/

resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

/* resource "google_project": The new project to create, bound to the desired organization ID and billing account */

resource "google_project" "project" {
  name            = var.project_name
  project_id      = random_id.id.hex
  billing_account = var.billing_account
  org_id          = var.org_id
}


resource "google_project_service" "service" {
  for_each = toset([
    "compute.googleapis.com"
  ])

  service = each.key

  project            = google_project.project.project_id
  disable_on_destroy = false
}

output "project_id" {
  value = google_project.project.project_id
}
