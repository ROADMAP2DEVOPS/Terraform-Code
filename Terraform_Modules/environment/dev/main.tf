module  "dev-vpc" {
    source           = "../../modules/vpc"


    vpc_cidr                        = var.vpc_cidr
    environment                     = var.environment
    project_name                    = var.project_name
    AWS_REGION                      = var.AWS_REGION
    realtechiePub-Sub1_cidr         = var.realtechiePub-Sub1_cidr 
    realtechiePub-Sub2_cidr         = var.realtechiePub-Sub2_cidr 
    realtechiePub-Sub3_cidr         = var.realtechiePub-Sub3_cidr 
    realtechiePri-Sub1_cidr         = var.realtechiePri-Sub1_cidr 
    realtechiePri-Sub2_cidr         = var.realtechiePri-Sub2_cidr 
    realtechiePri-Sub3_cidr         = var.realtechiePri-Sub3_cidr 
}