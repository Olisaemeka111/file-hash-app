resource "aws_security_group" "Jenkins-sg" {
  name        = "Jenkins-Security Group"
  description = "Open 22,443,80,8080,9000,9100,9090,3000"

  # Define a single ingress rule to allow traffic on all specified ports
  ingress = [
    for port in [22, 80, 443, 8080, 9000, 9100, 9090, 3000] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-sg"
  }
}


resource "aws_instance" "web" {
  ami                    = "ami-00bb6a80f01f03502" #change your ami value according to your aws instance
  instance_type          = "t2.large"
  key_name               = "chatgpt"
  vpc_security_group_ids = [aws_security_group.Jenkins-sg.id]
  user_data = file("${path.module}/script.sh")


  tags = {
    Name = "gpt clone"
  }
  root_block_device {
    volume_size = 30
  }
}
resource "aws_instance" "web2" {
  ami                    = "ami-00bb6a80f01f03502" #change your ami value according to your aws instance 
  instance_type          = "t2.medium"
  key_name               = "chatgpt"
  vpc_security_group_ids = [aws_security_group.Jenkins-sg.id]
  tags = {
    Name = "Monitering via grafana"
  }
  root_block_device {
    volume_size = 30
  }
}

resource "aws_instance" "web3" {
  ami                    = "ami-00bb6a80f01f03502" #change your ami value according to your aws instance
  instance_type          = "t2.medium"
  key_name               = "chatgpt"
  vpc_security_group_ids = [aws_security_group.Jenkins-sg.id]
  tags = {
    Name = "Monitering via prometheus"
  }
  root_block_device {
    volume_size = 30
  }
}
