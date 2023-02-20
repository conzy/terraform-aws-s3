variable "name" {
  type        = string
  description = "Will be appended to IAM Account Alias and region to create bucket name."
  validation {
    condition     = (can(regex("^[a-z-]+[a-z]+$", var.name)))
    error_message = "Name must satisfy ^[a-z-]+[a-z]+$ e.g my-cool-site ."
  }
}

variable "versioning" {
  type        = bool
  default     = true
  description = "Worth leaving this enabled for most uses cases.."
}

variable "public_access_block" {
  type        = bool
  default     = true
  description = "This is a sane default. Also worth considering enabling for the entire account."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to apply to the resource"
}

variable "disable_acls" {
  type        = bool
  default     = true
  description = "Disable ACLs. This is recommended for modern S3 configurations."
}
