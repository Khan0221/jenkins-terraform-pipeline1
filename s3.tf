resource "aws_s3_bucket" "b" {
    bucket = "my-jenkins-tf-bucket"
    acl    = "private"

    tags = {
        Name        = "My bucket1"
        Environment = "Dev"
    }
}