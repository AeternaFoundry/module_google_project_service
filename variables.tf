variable "project_services" {
  description = <<EOT
Map of project_services, attributes below
Required:
    - service
Optional:
    - deletion_policy
    - disable_dependent_services
    - disable_on_destroy
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    service                    = string
    deletion_policy            = optional(string)
    disable_dependent_services = optional(bool)
    disable_on_destroy         = optional(bool)
    project                    = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

