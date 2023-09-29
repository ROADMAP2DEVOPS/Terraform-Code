module  "dev-vpc" {
    source           = "../../modules/vpc"


    vpc_cidr                        = "10.0.0.0/16"
    environment                     = "development"
    project_name                    = "Walmart"
    AWS_REGION                      = "us-east-1"
    realtechiePub-Sub1_cidr         = "10.0.1.0/24"
    realtechiePub-Sub2_cidr         = "10.0.2.0/24"
    realtechiePub-Sub3_cidr         = "10.0.3.0/24"
    realtechiePri-Sub1_cidr         = "10.0.4.0/24"
    realtechiePri-Sub2_cidr         = "10.0.5.0/24"
    realtechiePri-Sub3_cidr         = "10.0.6.0/24"
}