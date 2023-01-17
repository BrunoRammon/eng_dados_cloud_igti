

resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "datalake_encryption_conf" {
  bucket = aws_s3_bucket.datalake.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_acl" "datalake_acl_conf" {
  bucket = aws_s3_bucket.datalake.id
  acl    = "private"
}

# resource "aws_s3_bucket_object" "notes" {
#   bucket = aws_s3_bucket.datalake.id
#   key    = "general/notes"
#   acl    = "private"
#   source = "../notes"
#   etag   = filemd5("../notes")
# }

resource "aws_s3_object" "notes" {
  bucket = aws_s3_bucket.datalake.id
  key    = "general/notes"
  source = "../notes"
  etag   = filemd5("../notes")
}

provider "aws" {
  region = "aws-east-1"
}