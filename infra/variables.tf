locals {
    name_prefix = "${var.project}-${var.environment}"
}

locals {
    vpc_cidr = data.aws_vpc.bebop_vpc.cidr_block
}

locals {
    private_subnet_cidr = [for subnet in local.private_subnet : subnet.cidr]
    public_subnet_cidr  = [for subnet in local.public_subnet : subnet.cidr]
}

locals {
    public_subnet = [
        {
            cidr              = cidrsubnet(local.vpc_cidr, 8, 111)
            availability_zone = "eu-west-2a"
            is_public         = true
        }, {
            cidr              = cidrsubnet(local.vpc_cidr, 8, 112)
            availability_zone = "eu-west-2b"
            is_public         = true
        }, {
            cidr              = cidrsubnet(local.vpc_cidr, 8, 113)
            availability_zone = "eu-west-2c"
            is_public         = true
        }
    ]
    private_subnet = [
        {
            cidr              = cidrsubnet(local.vpc_cidr, 8, 101)
            availability_zone = "eu-west-2a"
            is_public         = false
        }, {
            cidr              = cidrsubnet(local.vpc_cidr, 8, 102)
            availability_zone = "eu-west-2b"
            is_public         = false
        }, {
            cidr              = cidrsubnet(local.vpc_cidr, 8, 103)
            availability_zone = "eu-west-2c"
            is_public         = false
        }
    ]
}


variable "region" {
    default = "eu-west-2"
}

variable "project" {
    default = "gpconnect-infra"
}

variable "root_domain_name" {
    default = "dev.api.platform.nhs.uk"
}

variable "environment" {
    default = "dev"
}


variable "service" {
    default = "infra"
}

variable "registries" {
    default = ["mock-provider"]
}

variable "vpc_id" {
    default = "vpc-013e5e3a3aa2566e5"
}


variable "autoscaling_group_name" {
    default = "target-autoscaling-group"
}

variable "container_port" {
    default = 9000
}

variable "listener_port" {
    default = 80
}
