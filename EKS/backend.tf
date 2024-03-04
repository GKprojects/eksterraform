terraform {
  backend "s3" {
    bucket = "ekstfstatelock"
    key    = "ekstfstatelock.tfstate"
    region = "us-east-1"
    dynamodb_table  = "eksstatefile"
  }
}