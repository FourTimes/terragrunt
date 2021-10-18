# aws_instance creation
resource "aws_instance" "server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  key_name               = var.key_name
  # user_data              = data.template_file.user_data_mongodb_server.rendered
  tags              = merge({ Name = var.instanceName }, tomap(var.additional_tags))
  depends_on        = [aws_security_group.security-group]
  availability_zone = var.availability_zone
}

# aws_security_group creation
resource "aws_security_group" "security-group" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value
    }
  }
  vpc_id = var.vpc_id
  name   = "${var.instanceName}-security-group"
  tags   = merge({ Name = "${var.instanceName}-security-group" }, tomap(var.additional_tags))
}
