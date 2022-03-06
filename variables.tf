variable "billing_account" {}
variable "org_id" {}

variable "project_name" {
  description = "Name of the project to create"
  type        = string
}

variable "services_list" {
  description = "List of services to enable for the project"
  type        = list(string)
  default     = []
}
