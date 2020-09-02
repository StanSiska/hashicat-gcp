provider "null" {
  version = "~> 2.1"
}

locals {
  subnet_01 = "sis-subnet-01"
  subnet_02 = "sis-subnet-02"
  subnet_03 = "sis-subnet-03"
}

module "test-vpc-module" {
  source       = "../../"
  project_id   = var.project
  network_name = "sis"

  subnets = [
    {
      subnet_name   = "${local.subnet_01}"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name           = "${local.subnet_02}"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name               = "${local.subnet_03}"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = var.region
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
  ]
}