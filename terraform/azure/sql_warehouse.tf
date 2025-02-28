resource "databricks_sql_endpoint" "new" {
  count            = var.sqlw_id == "new" ? 1 : 0
  name             = "SAT Warehouse"
  cluster_size     = "Small"
  #If serverless is available uncomment this next line
  #enable_serverless_compute = true
  max_num_clusters = 1

  tags {
    custom_tags {
      key     = "owner"
      value   = data.databricks_current_user.me.user_name
    }
  }
}

data "databricks_sql_warehouse" "old" {
  count            = var.sqlw_id == "new" ? 0 : 1
  id = var.sqlw_id
}