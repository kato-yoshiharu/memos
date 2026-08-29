# Terraform

## 基本的な流れ

1. `versions.tf` を書く（`required_version` / `required_providers` / backend）

## ファイルの種類

ディレクトリ内の `*.tf` は全部まとめて読まれる。
分割は人間のための整理でしかなく、ファイル名に意味はない（`terraform.tfvars` などの特別扱いを除く）。

| ファイル              | 内容                                                            |
| --------------------- | --------------------------------------------------------------- |
| `main.tf`             | リソース定義の本体                                              |
| `.terraform.lock.hcl` | provider のバージョンロック                                     |
