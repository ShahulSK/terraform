resource "aws_instance" "appec2" {
    ami = var.ami-id
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "my_key_pair"
    vpc_security_group_ids = [ "aws_security_group.web_sg.id" ]
    subnet_id = module.vpc.public_subnets[0]
    tags = {
      "name" = "app"
    }
    depends_on = [
      module.vpc,
      aws_security_group.web_sg
    ]

  
}

resource "null_resource" "appprovisoner" {
    triggers = {
      running_number = var.web-trigger
    }
    provisioner "remote-exec" {
        connection {
          type = "ssh"
          user = "ubuntu"
          private_key = file("~/.ssh/id_rsa")
          host = aws_instance.appec2.public_ip
        }

        inline = [
          "sudo apt update",
          "sudo apt install nginx -y"
        ]
    }
    depends_on = [ aws_instance.appec2   ]

}
