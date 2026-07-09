# Network Module

## Purpose

This module provisions the core networking layer required for the platform.

## Resources

The module provisions:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

## Design

Public Subnets:
- Host internet-facing resources
- NAT Gateway resides here

Private Subnets:
- Host EKS worker nodes
- Host internal workloads

Internet Gateway:
- Provides public internet connectivity

NAT Gateway:
- Allows private resources to access the internet
- Prevents inbound internet access

## Inputs

| Name | Type | Description |
|--------|--------|--------|
| name | string | Network name |
| vpc_cidr | string | VPC CIDR |
| availability_zones | list(string) | Availability zones |
| public_subnets | list(string) | Public subnet CIDRs |
| private_subnets | list(string) | Private subnet CIDRs |

## Outputs

| Name | Description |
|--------|--------|
| vpc_id | VPC ID |
| public_subnets | Public subnet IDs |
| private_subnets | Private subnet IDs |
| public_route_table_ids | Public route tables |
| private_route_table_ids | Private route tables |
| nat_public_ips | NAT Gateway IP addresses |
