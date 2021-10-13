variable "databases" {
  type        = map(any)
  description = "The scaleway Database configurations"
}

variable "region" {
  type        = string
  description = "Region to be used with the scaleway provider"
  default     = "fr-par"
}

variable "zone" {
  type        = string
  description = "Zone to be used with the scaleway provider"
  default     = "fr-par-1"
}
