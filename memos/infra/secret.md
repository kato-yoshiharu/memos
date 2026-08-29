# シークレット管理

API キーや DB のパスワードといったシークレットを、どこで管理し、どこへ渡すかの方針をまとめたもの。
Terraform / GitHub Actions / AWS を前提に、選択肢と使い分け、踏みやすい落とし穴を書いている。

## 保管場所・受け渡し経路・タイミングを分けて考える

どこに置くかと、どうやって渡すかは別の問題。

- **保管場所**: GitHub Secrets、AWS Secrets Manager、SSM Parameter Store など
- **受け渡し経路**: `TF_VAR_*` 環境変数、Lambda の環境変数、`wrangler secret put` など
