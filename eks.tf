module "eks"{
    source = "terraform-eks-aws/eks/aws"
    version = "19.5.1"
    cluster_name = local.name
    cluster_endpoint_public_access = true
    cluster_addons ={
        coredns {
            most_recent =true
        }
        kube-proxy  = {
            most_recent =true
        }
        vpc-cni = {
            most_recent = true
        }
        vpc_id= locla.vpc.vpc_id
        subnet_ids = local.privte_subnets_tags
        control_plane = locl.intra_subnets
    }

       eks_managed_node_group_default = {
        eks-cluste-wg = {
            ami_type = "AL2_x86_64"
            instance_type = ["m5.large"]
            attach_seceruty_group =true
        }
        }
        
        eks_managed_node_group = {
            min_size = 1
            max_size = 2
            disered_size = 1
            instance_type = ["t3.large"]
            capacity_type = "SPOT"  
        }

       }

