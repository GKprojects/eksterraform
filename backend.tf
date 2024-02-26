terraform {
  backend "s3" {
    bucket = "gkekstfstatelock"
    key    = "gkekstfstatelock.tfstate"
    region = "us-east-2"
    dynamodb_table  = "gkekstfstatefile"
  }
}