terraform {
  backend "s3" {
    bucket = "thisisfirst"
    key = "ntierdeploydev"
    region = "us-west-2"
    dynamodb_table = "thisisfirst"
  }
      
}