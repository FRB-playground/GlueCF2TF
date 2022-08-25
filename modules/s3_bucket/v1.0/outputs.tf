#######################
### KMS Key outputs ###
#######################
output "s3_bucket_kms_key" {
  value = aws_kms_key.key.id
}

output "s3_bucket_kms_key_arn" {
  value = aws_kms_key.key.arn
}

#########################
### S3 Bucket outputs ###
#########################
output "bucket_name" {
  value = aws_s3_bucket.main.id
}

output "bucket_arn" {
  value = aws_s3_bucket.main.arn
}
