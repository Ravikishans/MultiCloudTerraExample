output "bucket_name" {
  description = "value"
  value = module.aws.aws_s3_bucket
}
output "bucket_website_url" {
    description = "this is wesite endpoint of s3 bucket"
    value = module.aws.s3_website_url
}
output "file_url" {
  description = "file_url"
  value = module.aws.file_url
}
output "bucket_regional_domain_name" {
  value = module.aws.bucket_regional_domain_name
}


output "cloudfront_domain_name" {
  value = module.aws.cloudfront_domain_name
}
output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = module.aws.cloudfront_distribution_arn
}

output "cloudfront_status" {
  description = "The current status of the CloudFront distribution"
  value       = module.aws.cloudfront_status
}
