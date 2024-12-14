resource "aws_instance" "expense" { 
    for_each = var.instance_type
    ami = data.aws_ami.joindevops.id
    instance_type = each.value
    vpc_security_group_ids = var.allow_ssh
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )
}