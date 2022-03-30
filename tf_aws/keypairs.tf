resource "aws_key_pair" "deployer-keypair" {
    key_name = "login-key"
    public_key = "${file("${var.public_key}")}"

}