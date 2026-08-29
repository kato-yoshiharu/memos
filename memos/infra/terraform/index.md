# Terraform

## 基本的な流れ

1. main.tfに設定を書く
2. `terraform init`
3. `terraform fmt` / `terraform validate`
4. `terraform plan`
5. `terraform apply`

## ファイルの種類

ディレクトリ内の `*.tf` は全部まとめて読まれる。
分割は人間のための整理でしかなく、ファイル名に意味はない（`terraform.tfvars` などの特別扱いを除く）。

| ファイル              | 内容                                                            |
| --------------------- | --------------------------------------------------------------- |
| `main.tf`             | リソース定義の本体                                              |
