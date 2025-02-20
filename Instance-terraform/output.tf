
output "name" {
  value = aws_instance.web.public_dns

}

output "name2" {
  value = aws_instance.web2.public_dns

}

output "name3" {
  value = aws_instance.web3.public_dns

}



