output "aws_s3_bucket" {
  description = "s3 bucket name"
  value = module.s3_bucket.bucket_name
}

output "s3_website_url" {
  description = "website url"
  value = module.s3_bucket.bucket_website_url
}

output "bucket_regional_domain_name" {
  value = module.s3_bucket.bucket_regional_domain_name
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.aws_cloudfront_distribution.cloudfront_domain_name
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = module.aws_cloudfront_distribution.cloudfront_distribution_arn
}

output "cloudfront_status" {
  description = "The current status of the CloudFront distribution"
  value       = module.aws_cloudfront_distribution.cloudfront_status
}

output "file_url" {
  description = "index.html url"
  value = module.s3_bucket.file_url
}