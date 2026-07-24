# AWS アカウント

## アカウント作成後のセットアップ手順

### フェーズ0：管理アカウントの土台固め

- [ ] ルートユーザーに MFA 設定
  - console で設定する
  - root-macbook-touchid
  - iCloud keychain
- [ ] 管理者IAMユーザーを1つ作成＋アクセスキー発行
  - console で設定する
- [ ] CLIプロファイル設定（`--profile xxx`）＋接続確認
- [ ] 請求アラート（Budgets）設定

### フェーズ1：Organization の骨格を作る

- Organizations 有効化
  - メンバーアカウントを作成するために必要。
- IAM Identity Center 有効化
  - console で設定する
  - 1つの IAM Identity Center でそれぞれのメンバーアカウントに対してSSOログインができる

### フェーズ2：Terraform でコード化

- メンバーアカウント作成
- 許可セット / ユーザー / アカウント割り当て

### フェーズ3：本番運用へ移行

- 以降は Identity Center からログイン
- 役目を終えた管理者IAMユーザーを削除
