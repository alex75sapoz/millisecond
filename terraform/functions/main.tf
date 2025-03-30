locals {
  python_packages_metadata = jsondecode(file("${path.module}/python_packages_metadata.json"))
}

data "archive_file" "python_packages" {
  type        = "zip"
  source_dir  = "${path.module}/${local.python_packages_metadata.directory}"
  output_path = "${path.module}/${local.python_packages_metadata.directory}.zip"
}

resource "aws_lambda_layer_version" "python_packages" {
  filename                 = data.archive_file.python_packages.output_path
  layer_name               = "python-packages-${var.constants.environment.id}"
  compatible_runtimes      = [local.python_packages_metadata.runtime]
  compatible_architectures = [local.python_packages_metadata.architecture]
  source_code_hash         = jsonencode(local.python_packages_metadata.packages)
}