resource "aws_key_pair" "deployer-keypair" {
    key_name = "login-key"
    public_key = "${var.public_key}"

}