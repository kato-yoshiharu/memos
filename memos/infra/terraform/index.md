# Terraform

## 基本的な流れ

1. `terraform` ブロックを書く（`required_version` / `required_providers` / backend）
2. `provider` ブロックを書く（region など）
3. `terraform init`
4. リソースを定義する
5. `terraform fmt` / `terraform validate`
6. `terraform plan`
7. `terraform apply`

## ファイルの種類

ディレクトリ内の `*.tf` は全部まとめて読まれる。
分割は人間のための整理でしかなく、ファイル名に意味はない（`terraform.tfvars` などの特別扱いを除く）。

- `versions.tf` — `terraform` ブロック。`required_version` / `required_providers`
- `providers.tf` — `provider "aws" {}` などの provider 設定
