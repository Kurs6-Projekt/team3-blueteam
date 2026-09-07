terraform {
  backend "gcs" {
    bucket = "team3-tfstate-87e75501"
    prefix = "terraform/state"
  }
}
