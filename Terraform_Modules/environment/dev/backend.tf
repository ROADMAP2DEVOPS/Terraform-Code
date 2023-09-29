terraform {
    backend "s3-bucket" {
        bucket          = "my-terraformed-project"
        key             = "environments/dev/terraform_state"
        region          = var.AWS_REGION
    }

}