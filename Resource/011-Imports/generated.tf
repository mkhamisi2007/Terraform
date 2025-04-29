# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "test"
resource "aws_dynamodb_table" "example" {
  billing_mode                = "PAY_PER_REQUEST"
  deletion_protection_enabled = false
  hash_key                    = "id"
  name                        = "test"
  range_key                   = null
  read_capacity               = 0
  restore_date_time           = null
  restore_source_name         = null
  restore_source_table_arn    = null
  restore_to_latest_time      = null
  stream_enabled              = false
  stream_view_type            = null
  table_class                 = "STANDARD"
  tags = {
    family = "khamisi"
  }
  tags_all = {
    family = "khamisi"
  }
  write_capacity = 0
  attribute {
    name = "id"
    type = "S"
  }
  point_in_time_recovery {
    enabled = false
  }
  ttl {
    attribute_name = null
    enabled        = false
  }
}

# __generated__ by Terraform
resource "aws_vpc" "default_vpc" {
  assign_generated_ipv6_cidr_block     = false
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv4_ipam_pool_id                    = null
  ipv4_netmask_length                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  ipv6_netmask_length                  = 0
  tags                                 = {}
  tags_all                             = {}
}
