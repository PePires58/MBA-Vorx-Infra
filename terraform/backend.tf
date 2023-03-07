terraform {
  backend "s3" {
    bucket = "vorx-tf-artifacts"
    key    = ""
    region = "east-us-1"
  }
}
