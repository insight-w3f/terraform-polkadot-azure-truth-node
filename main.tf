module "node" {
  source                        = "github.com/insight-w3f/terraform-polkadot-azure-node.git?ref=master"
  create                        = true
  create_eip                    = true
  node_name                     = var.node_name
  instance_type                 = var.instance_type
  private_key_path              = var.private_key_path
  chain                         = var.chain
  project                       = var.project
  application_security_group_id = var.application_security_group_id
  azure_resource_group_name     = var.azure_resource_group_name
  network_security_group_id     = var.network_security_group_id
  private_subnet_id             = var.private_subnet_id
  public_key_path               = var.public_key_path
  public_subnet_id              = var.public_subnet_id
}

module "ansible" {
  source = "github.com/insight-infrastructure/terraform-aws-ansible-playbook.git?ref=v0.12.0"

  ip                     = module.node.public_ip
  user                   = var.ssh_user
  private_key_path       = var.private_key_path
  playbook_file_path     = "${path.module}/ansible/main.yml"
  requirements_file_path = "${path.module}/ansible/requirements.yml"
  forks                  = 1

  playbook_vars = {
    aws_access_key_id : aws_iam_access_key.sync.id,
    aws_secret_access_key : aws_iam_access_key.sync.secret,
    sync_bucket_uri : aws_s3_bucket.sync.id,
    region : var.region,
  }

  module_depends_on = module.node
}
