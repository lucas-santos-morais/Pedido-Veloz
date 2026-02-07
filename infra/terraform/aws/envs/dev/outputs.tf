output "project" {
  value = {
    name        = var.project_name
    environment = var.environment
    region      = var.aws_region
  }
}

output "ecr_repos" {
  value = {
    orders    = module.ecr_orders.repository_url
    payments  = module.ecr_payments.repository_url
    inventory = module.ecr_inventory.repository_url
  }
}
