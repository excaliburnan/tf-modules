resource "aws_instance" "ec2_example" {
    ami = "${lookup(var.webserver_amis, var.aws_region)}" 
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform AWS EC2"
    }
}