# Terraform

## 自動補完

<https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#enable-tab-completion>

## Start

1. main.tfに設定を書く
2. `terraform init`
3. `terraform plan`
4. `terraform apply`

## main.tf

## state

Terraformが管理しているリソースのスナップショット。
デフォルトでは `terraform.tfstate` に保存される。

`terraform plan` は、設定と state を比較して差分を出し、`apply` 後に state を更新する。

## 自動補完

<https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#enable-tab-completion>
