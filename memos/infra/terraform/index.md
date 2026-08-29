# Terraform

## 基本的な流れ

1. main.tfに設定を書く
2. `terraform init`
3. `terraform fmt` / `terraform validate`
4. `terraform plan`
5. `terraform apply`

## ファイルの種類

ディレクトリ内の `*.tf` は全部まとめて読まれる。
| ファイル              | 内容                                                            |
| --------------------- | --------------------------------------------------------------- |
| `main.tf`             | リソース定義の本体                                              |
