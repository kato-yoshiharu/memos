# シークレット管理

API キーや DB のパスワードといったシークレットを、どこで管理し、どこへ渡すかの方針をまとめたもの。
Terraform / GitHub Actions / AWS を前提に、選択肢と使い分け、踏みやすい落とし穴を書いている。

## 保管場所・受け渡し経路・タイミングを分けて考える

どこに置くかと、どうやって渡すかは別の問題。

- **保管場所**: GitHub Secrets、AWS Secrets Manager、SSM Parameter Store など
- **受け渡し経路**: `TF_VAR_*` 環境変数、Lambda の環境変数、`wrangler secret put` など

`tfvars` か Secrets Manager か、という問いは実は択一ではない。
「GitHub Secrets に保管し、`TF_VAR_*` として Terraform に渡す」のように、保管場所と経路を組み合わせて決める。

もう1つの軸が**いつ必要か**。

デプロイ時のものは CI に置く。実行時のものは実行環境（Secrets Manager など）に置く。
