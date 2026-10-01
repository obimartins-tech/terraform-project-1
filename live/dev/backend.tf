terraform {
  backend "s3" {
    bucket       = "terraform-project-1-state-841338716314"
    key          = "live/dev/terraform.tfstate"
    region       = "us-east-2"
    use_lockfile = true
    encrypt      = true
  }
}
