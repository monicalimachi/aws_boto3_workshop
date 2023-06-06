provider "aws" {
  region = "us-east-1"
}

# Below Code will generate a secure private key with encoding
resource "tls_private_key" "ed25519-example" {
  algorithm = "ED25519"
}
# Create the Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "botos3_workshop"
  public_key = tls_private_key.ed25519-example.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {

  filename = "${aws_key_pair.key_pair.key_name}.pem"
  content  = tls_private_key.ed25519-example.private_key_pem
}
