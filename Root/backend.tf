# resource "aws_s3_bucket" "backend_bucket" {
#   bucket = "backend-priyanshu209"
# }
# resource "aws_s3_bucket_versioning" "version" {
#   bucket = aws_s3_bucket.backend_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
# resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
#   bucket = aws_s3_bucket.backend_bucket.bucket
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#    }
#   }
# }

# resource "aws_dynamodb_table" "locking" {
# name         = "backend-priyanshu209-lock"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
# attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
