module "aws" {
    source = "terraform-vpc-aws/vpc/aws"
    version = "~4.0"
    name = local.name
    vpc_cird = local.vpc_cird
    public_subnets = local.public_subnets
    privte_subnets = local.privte_subnets
    intra_subnets = local.intra_subnets

    enable_nat_gateway = true
}

public_subnets_tgs{
    kubernetes.io/role/elb = 1
}
privte_subnets_tags{
    kubernetes.io/role/externl-elb = 1
}