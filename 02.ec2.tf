resource "aws_instance" "ec2_provisioners" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = "buildkey"

  provisioner "local-exec" {
    command = "echo 'Hello from ${aws_instance.ec2_provisioners.private_ip}' > instance-info.txt"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo systemctl start nginx",
      "echo '<h1>Hello from NIve to all</h1>' | sudo tee -a /var/www/html/index.html"
    ]
  }

  provisioner "file" {
    source      = "file2beCopied.txt"
    destination = "/home/ubuntu/file2becopied.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("buildkey.pem")
    host        = self.public_ip


  }

}
