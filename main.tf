provider "aws" {
    region = "us-east-2"
}

# Creating S3 bucket with lifecycle rule

resource "aws_s3_bucket" "b" {
  bucket = "yourname-09876"
  acl    = "private"
  lifecycle_rule {
    enabled = true

    transition {
      days          = 120
      storage_class = "GLACIER"
    }

    expiration {
      days = 3650
    }
  }
}

# Creating first folder

resource "aws_s3_bucket_object" "data1" {
    bucket = aws_s3_bucket.b.id
    acl    = "private"
    key    = "data1/"
    source = "/dev/null"
}

# Creating second folder & file

resource "aws_s3_bucket_object" "file" {
    bucket = aws_s3_bucket.b.id
    acl    = "private"
    key    = "data2/file.txt"
    source = "file.txt"
}


