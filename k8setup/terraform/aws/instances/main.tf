provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "../modules/ec2" 

  instance_name  = "k8s-node"
  ami_id         = "ami-0ad21ae1d0696ad58"
  instance_type  = "t2.large"
  key_name       = "praseetha"
  subnet_ids     = ["subnet-00e818af91b811a24", "subnet-0799454986e8d60fb"]
  instance_count = 3

  inbound_from_port  = ["0", "6443", "22", "30000"]
  inbound_to_port    = ["65000", "6443", "22", "32768"]
  inbound_protocol   = ["TCP", "TCP", "TCP", "TCP"]
  inbound_cidr       = ["172.31.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]
  outbound_from_port = ["0"]
  outbound_to_port   = ["0"]
  outbound_protocol  = ["-1"]
  outbound_cidr      = ["0.0.0.0/0"]
}
