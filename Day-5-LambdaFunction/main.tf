resource "aws_s3_bucket" "Lambda-S3" {
  bucket        = "s3bucketforlambdafunction0103"
  acl           = "private"
  force_destroy = true
  tags = {
    Name = "Lambda Bucket"
  }
}

resource "aws_s3_object" "lambda_code" {
  bucket = aws_s3_bucket.Lambda-S3.id
  key    = "lambda-function.zip"
  source = "lambda_function.zip"
  etag   = filemd5("lambda_function.zip")

}
resource "aws_iam_role" "Lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_exceution" {
  role       = aws_iam_role.Lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}

resource "aws_lambda_function" "name" {
  function_name = "Dev"
  runtime       = "python3.13"
  role          = "arn:aws:iam::640168445641:role/service-role/Dev-role-n5d65ngm"
  handler       = "lambda-function-handler"
  s3_bucket     = aws_s3_bucket.Lambda-S3.id
  s3_key        = aws_s3_object.lambda_code.key
  timeout       = 10
  memory_size   = 128
  tags = {
    Name = "Aws-lambda"
  }
}