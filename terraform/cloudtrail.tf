resource "aws_s3_bucket" "cloudtrail" {
  bucket = "lite-thinking-cloudtrail-${random_id.bucket.hex}"
}

resource "random_id" "bucket" {
  byte_length = 4
}

resource "aws_s3_bucket_policy" "cloudtrail" {

  bucket = aws_s3_bucket.cloudtrail.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "AWSCloudTrailAclCheck"

        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = "s3:GetBucketAcl"

        Resource = aws_s3_bucket.cloudtrail.arn

      },

      {

        Sid = "AWSCloudTrailWrite"

        Effect = "Allow"

        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }

        Action = "s3:PutObject"

        Resource = "${aws_s3_bucket.cloudtrail.arn}/AWSLogs/*"

        Condition = {

          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }

        }

      }

    ]

  })

}

resource "aws_cloudtrail" "trail" {

  name = "LiteThinkingTrail"

  s3_bucket_name = aws_s3_bucket.cloudtrail.id

  include_global_service_events = true

  is_multi_region_trail = true

  enable_logging = true

  depends_on = [
    aws_s3_bucket_policy.cloudtrail
  ]

}