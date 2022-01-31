resource "random_id" "suffix" {
  byte_length = 5
}


module "postgress-db" {
  source               = "../"
  name                 = "postgress-sql"
  random_instance_name = true
  project_id           = "terraform-test-project-338512"

  deletion_protection = false

  database_version = "POSTGRES_11"
  region           = "us-central1"
  zone             = "us-central1-c"
  tier             = "db-f1-micro"
  disk_size        = 20
  disk_type        = "PD_SSD"
  pricing_plan     = "PER_USE"
  maintenance_window_day          = 2
  maintenance_window_hour         = 22
  maintenance_window_update_track = "canary"

  additional_databases = [
    {
      name       = "testdb"
      charset    = ""
      collation  = ""
    }
   ]
  
  additional_users = [
    {
      name     = "appuser"
      password = "PaSsWoRd"
      host     = "localhost"
      type     = "BUILT_IN"
    },
    {
      name     = "user2"
      password = "PaSsWoRd"
      host     = "localhost"
      type     = "BUILT_IN"
    },
  ]
}