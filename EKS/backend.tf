terraform {
  backend "s3" {
    bucket = "gkekstfstatelock"
    key    = "ekstfstatelock.tfstate"
    region = "us-east-1"
    dynamodb_table  = "eksstatefile"
  }
}