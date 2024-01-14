provider "aws" {
  region = "us-east-1"  # Replace with your preferred region
}

resource "aws_instance" "kubemonitor_instance" {
  ami           = "ami-0005e0cfe09cc9050"  # Replace with the AMI ID
  instance_type = "t2.xlarge"               # Adjust instance type accordingly

  tags = {
    Name = "KubeMonitorInstance"
  }
}
