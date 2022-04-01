resource "aws_instance" "ec2_example" {
    ami = "${lookup(var.webserver_amis, var.aws_region)}" 
    instance_type = "t2.micro" 
    tags = {
        Name = "Terraform AWS EC2"
    }

    key_name = "${aws_key_pair.deployer-keypair.key_name}"

    vpc_security_group_ids = ["${aws_security_group.web_server_sec_group.id}"]

    provisioner "local-exec" {
        command = "echo public_ip: ${aws_instance.ec2_example.public_ip} > ec2_ip.txt"
    }

    provisioner "file" {
            source = "setup.sh"
            destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/bootstrap.sh",
            "/tmp/bootstrap.sh"
        ]
    }

    provisioner "file" {
        source = "./index.html"
        destination = "/var/www/html/index.html"
    }

    connection {
        host = self.public_ip
        type = "ssh"
        user = "ec2-user"
        private_key = "${var.private_key}"
    }

}