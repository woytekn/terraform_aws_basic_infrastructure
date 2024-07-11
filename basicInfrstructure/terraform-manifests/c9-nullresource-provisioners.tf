# Create a null resource and provisioners

resource "null_resource" "my_null_resource" {
    depends_on = [ module.ec2_public_bastion_instance ]
    connection {
      type = "ssh"
      host = aws_eip.bastion_host.public_ip
      user = "ec2-user"
      private_key = file("private-key/terraform-key.pem")
    }
    provisioner "file" {
      source = "private-key/terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
    }
    provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/terraform-key.pem" ]
}
    provisioner "local-exec" {
      command = "echo VPC create on `date` and VPC id: ${module.vpc.vpc_id} >> creation-time-vpc.txt"
      working_dir = "./local-exec-output-files/"
      on_failure = continue
    }
    # provisioner "local-exec" {
    # command = "echo Destroy time `date` >> destroy-time-vpc-id.tx"
    #   working_dir = "./local-exec-output-files/"
    #   when = destroy
    # }
}