data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }
}


resource "aws_instance" "myec2" {
  tags = {
    name = "jenkins instance"
  }


  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance-type // give your respective size
  user_data              = file("jenkinssetup.sh")
  key_name               = "myfirstasgkeypair" //give your key-pair name for SSH
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]

}
