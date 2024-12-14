resource "aws_instance" "ven" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = ["sg-04177bb468ff68998"]
    tags = {
        Name = "ven-${terraform.workspace}"
    }
}