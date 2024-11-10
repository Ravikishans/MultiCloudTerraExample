resource "aws_s3_bucket" "webbucket" {
  bucket = var.bucket_name
  # acl = var.acl

  # website {
  #   index_document = "index.html"
  #   error_document = "index.html"
  # }
}

resource "aws_s3_bucket_website_configuration" "webbucket" {
  bucket = aws_s3_bucket.webbucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.webbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.webbucket.id
  policy = jsonencode(
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "${aws_s3_bucket.webbucket.arn}/*"
            }
        ]
    }
  )
}

# Upload a file to the S3 bucket
resource "aws_s3_object" "example_file" {
  bucket = aws_s3_bucket.webbucket.bucket
  key    = "index.html"       # S3 path where the file will be uploaded
  source = "/mnt/c/Users/Ravik/Desktop/azureDevOps/TravelMemory/index.html" # Local file path on your system
  # acl    = "public-read"                    # Set ACL based on your requirements (e.g., public-read)
}


output "bucket_name" {
  description = "this is the buckeet name"
  value = aws_s3_bucket.webbucket.bucket
}
output "bucket_website_url" {
    description = "this is website domain of s3 bucket"
    value = aws_s3_bucket_website_configuration.webbucket.website_domain
}

output "bucket_website_endpoint" {
    description = "this is website endpoint of s3 bucket"
    value = aws_s3_bucket_website_configuration.webbucket.website_endpoint
}

# output "website_endpoint" {
#   value = "http://${aws_s3_bucket.webbucket.bucket}.s3-website-${var.aws_region}.amazonaws.com"
#   description = "The website endpoint URL of the S3 bucket"
# }

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.webbucket.bucket_regional_domain_name
}

# Output the URL of the uploaded file
output "file_url" {
  value = "http://${aws_s3_bucket.webbucket.website_endpoint}/index.html"
}