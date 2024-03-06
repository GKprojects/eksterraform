terraform {
  backend "s3" {
    bucket = "ekstfstatelock"
    key    = "statefile/ekstfstatelock.tfstate"
    region = "us-east-1"
    dynamodb_table  = "eksstatefile"
  }
}
