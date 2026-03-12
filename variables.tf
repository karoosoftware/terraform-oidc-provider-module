variable "url" {
  description = "OIDC provider URL, for example https://token.actions.githubusercontent.com"
  type        = string

  validation {
    condition     = can(regex("^https://", var.url))
    error_message = "The url must start with https://."
  }
}

variable "client_id_list" {
  description = "List of client IDs (audiences) allowed for this OIDC provider"
  type        = list(string)

  validation {
    condition     = length(var.client_id_list) > 0
    error_message = "client_id_list must contain at least one audience."
  }
}

variable "thumbprint_list" {
  description = "List of server certificate thumbprints for the OIDC provider"
  type        = list(string)

  validation {
    condition     = length(var.thumbprint_list) > 0
    error_message = "thumbprint_list must contain at least one thumbprint."
  }
}

variable "tags" {
  description = "Tags to apply where supported"
  type        = map(string)
  default     = {}
}