# tfawslib-vpc
Terraform module implementing standardized VPC

## Required Inputs:  
+ variable "costcenter" { type="string" } - tag for CostCenter showback
+ variable "nameprefix" { type="string" } - prefix for naming related ressources

## Optional Inputs:
+ variable "region" { default="eu-west-1" type="string" } - AWS Region
+ variable "netaddr" { default="10.0.0.0" type="string" } - Start of VPC IP Range
+ variable "netsize" { default="24" type="string" } - CIDR size of VPC IP Range
+ variable "azs" { default="3" type="string" } - Number of Availability Zones to use
+ variable "appnetflag" { default="true" type="string" } - Determines if App networks should be created
+ variable "intdns" { default=true type="string" } - Determines if Private DNS should be used
+ variable "intdnszone" { default="" type="string" } - Overrides the default zonename for private DNS

## Additional inputs available for tweaking in special cases:
+ variable "dmzbitz" { default="0" type="string" } - Additional subnetmask bits for determining DMZ networks sizes
+ variable "appbitz" { default="0" type="string" } - Additional subnetmask bits for determining App networks sizes
+ variable "appnetnumoffsetz" { default="0" type="string" } - The number of App net subnets to be skipped due to DMZ subnets



## Outputs:  
+ "dmznets" - list of subnet ID's for DMZ networks  
+ "appnets" - list of subnet ID's for Application networks  
+ "igwid" - ID for Internet Gateway  
+ "pubrt" - ID for routing table with direct internet access  
+ "newbits" - additional bits in subnet network mask  
+ "azcount" - adjusted number of availability zones used  
+ "azlist" - list of names of the availability zones used  
+ "nat_routing_tables" - list of routing tables for internet access through NAT gateways  
+ "nat_public_ips" - public IP addresses associated with NAT gateways  
+ "vpcid" - ID of the VPC created  
+ "region" - AWS Region
+ "internal_dns_zoneid" - ID for Route53 Zone used for internal DNS
+ "internal_dns_zonename" - Zone name used for internal DNS


## Example:
```hcl
variable "costcenter" { default="MyLab" }  
variable "nameprefix" { default="MyTest" }  
  
module "vpc" {  
  source = "git@github.com:basefarm/tfawslib-vpc"  
  costcenter = "${var.costcenter}"  
  nameprefix = "${var.nameprefix}"  
}  
```
This creates a VPC called "MyLab" in the EU-West-1 region with IP Range 10.0.0.0/24, containing 3 /28 DMZ networks with direct Internet access and 3 /26 App networks with Internet access through 2 NAT gateways.
   
