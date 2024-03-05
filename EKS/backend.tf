terraform {
  backend "s3" {
    bucket = "ekstfstatelock"
    key    = "0342024/ekstfstatelock.tfstate"
    region = "us-east-1"
    dynamodb_table  = "eksstatefile"
  }
}
