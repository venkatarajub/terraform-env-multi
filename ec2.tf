resource "aws_instance" "expense" {
    for_each = var.instances
    ami = data.aws_ami.joindevops.id
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.exp-sg.id]
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )
}

resource "aws_security_group" "exp-sg" {
    name = "exp-sg-${var.environment}"
    description = "sg for expense project"
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = "exp-sg-${var.environment}"
        }
    )
}