variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The Google Cloud region"
  type        = string
  default     = "europe-north2"
}

variable "jumphost_zone" {
  description = "Override zone for the jumphost instance. Defaults to the first zone in the region."
  type        = string
  default     = null
}

variable "primary_zone" {
  description = "Override zone for the primary instance. Defaults to the second zone in the region."
  type        = string
  default     = null
}

variable "team_id" {
  description = "The team ID"
  type        = number
}

variable "ssh_users" {
  description = "List of SSH users and their public keys for instance access"
  type = list(object({
    username   = string
    public_key = string
  }))
}

variable "ssh_source_ranges" {
  description = "Källadresser som tillåts nå SSH på jumphosten. Snävas åt när en stabil åtkomstväg finns."
  type        = list(string)
}

variable "os_admin_users" {
  type        = list(string)
  description = "E-postadresser som ska få osAdminLogin på jumphosten"
  default     = []
}

variable "os_login_users" {
  type        = list(string)
  description = "E-postadresser som ska få standard-OS Login på jumphosten"
  default     = []
}
