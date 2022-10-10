module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.0.2"

  function_name = "helloworld"
  description   = "Hello world lambda function"
  handler       = "helloworld.lambda_handler"
  runtime       = "python3.8"

  source_path = "../../src/helloworld.py"

  store_on_s3 = true
  s3_bucket   = "s3-packages-lambda-builds-helloworld"

  tags = {
    Name = "helloworld"
    Env  = "dev"
  }
}

resource "aws_s3_bucket" "s3-packages-lambda-builds-helloworld" {
  bucket = "s3-packages-lambda-builds-helloworld"

  tags = {
    Name = "helloworld"
    Env  = "dev"
  }
}

resource "aws_s3_bucket_acl" "s3-packages-lambda-builds-helloworld" {
  bucket = aws_s3_bucket.s3-packages-lambda-builds-helloworld.id
  acl    = "private"
}

data "aws_s3_bucket" "helloworld-logging-bucket" {
  bucket = "helloworld-logging-bucket"
}

resource "aws_s3_bucket_logging" "helloworld-logging-bucket" {
  bucket = data.aws_s3_bucket.helloworld-logging-bucket.id

  target_bucket = aws_s3_bucket.s3-packages-lambda-builds-helloworld.id
  target_prefix = "log/"
}