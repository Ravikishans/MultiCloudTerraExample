module "s3_bucket" {
  source = "./modules/s3_bucket"
  bucket_name = "rakshi2502"
  acl = "public-read"
}

module "aws_cloudfront_distribution" {
  source = "./modules/cloudfront"
  bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name
}