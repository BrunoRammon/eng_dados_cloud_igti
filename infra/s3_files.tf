resource "aws_s3_object" "notes" {
  bucket = aws_s3_bucket.datalake.id
  key    = "general/notes"
  source = "../notes"
  acl = "private"
  etag   = filemd5("../notes")
}