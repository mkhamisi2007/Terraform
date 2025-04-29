output "vpcid" {
  value = local.vpcid
}
output "publicsubnet1a" {
  value = local.subnetid_1a 
}
output "publicsubnet1b" {
  value = local.subnetid_1b 
}

locals {
  vpcid = "vpc-044d5e3bdaad93ab5"
  subnetid_1b = "subnet-0bf42c1ab0f162460"
  subnetid_1a = "subnet-01de64f713e68c21e"
}