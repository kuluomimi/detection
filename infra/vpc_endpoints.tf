module "vpc_endpoints" {
  source = "./vpc_endpoints"

  vpc_id      = local.vpc_id
  name_prefix = local.name_prefix
  subnet_ids  = module.private_subnets.*.subnet_id
}
