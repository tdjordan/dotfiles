module "aws_instance" {
  source        = "./module"

  ami           = "[redacted]"
  instance_type = "t1.2xlarge"
}
