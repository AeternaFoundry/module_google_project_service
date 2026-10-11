resource "google_project_service" "project_services" {
  for_each = var.project_services

  service                    = each.value.service
  deletion_policy            = each.value.deletion_policy
  disable_dependent_services = each.value.disable_dependent_services
  disable_on_destroy         = each.value.disable_on_destroy
  project                    = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

