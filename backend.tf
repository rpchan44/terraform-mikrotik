terraform {
  backend "s3" {
    bucket                      = "mikrotik"
    key                         = "mikrotik"
    region                      = "us-east-1"
    access_key                  = "minioadmin"
    secret_key                  = "minioadmin"
    skip_credentials_validation = true
    skip_region_validation      = true
    use_path_style              = true
    skip_requesting_account_id  = true
    endpoints = {
      s3 = "http://192.168.51.99:9000"
    }
  }
}
