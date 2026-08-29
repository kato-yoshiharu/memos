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

|            | 必要なタイミング                       | 例                                 |
| ---------- | -------------------------------------- | ---------------------------------- |
| デプロイ時 | `terraform apply` や CI が動く瞬間だけ | AWS 認証情報、各種 API キー        |
| 実行時     | アプリが動いている間ずっと             | DB 接続文字列、外部 API のトークン |

デプロイ時のものは CI に置く。実行時のものは実行環境（Secrets Manager など）に置く。

## 保管場所の選択肢

| 保管場所                    | 主な用途                     | 備考                                                 |
| --------------------------- | ---------------------------- | ---------------------------------------------------- |
| `terraform.tfvars`          | ローカル開発のみ             | gitignore 必須。CI からは使えない                    |
| GitHub Actions Secrets      | デプロイ時のシークレット     | ログで自動マスクされる。値は読み出せない             |
| GitHub Actions Variables    | シークレットでない設定値     | アカウント ID、リージョンなど                        |
| AWS Secrets Manager         | 実行時のシークレット         | 自動ローテーション対応。有料                         |
| AWS SSM Parameter Store     | 実行時のシークレット・設定値 | `SecureString` で暗号化。標準パラメータは無料        |
| Cloudflare Workers secret   | Worker の実行時              | `wrangler secret put`。ダッシュボードでも設定可      |
| Lambda の環境変数           | Lambda の実行時              | 手軽だが、コンソールで平文で見える。KMS 暗号化は別途 |
| SOPS / git-crypt            | 暗号化してリポジトリに置く   | 鍵管理が別途必要。GitOps 系で使われる                |
| Vault / Doppler / 1Password | 一元管理                     | 個人〜小規模には過剰なことが多い                     |

## 使い分け

### そもそもシークレットを作らないのが最善

**GitHub OIDC + IAM ロールの AssumeRole** を使えば、長期の AWS アクセスキーを保管する必要がなくなる。
「保管しないものは漏れない」ので、置き場所を選ぶ前にまずこれを検討する。

同様に、Neon や Cloudflare も OIDC に対応していれば同じ発想が使える（未対応なら API キーを Secrets に置く）。

### デプロイ時 → GitHub Secrets → `TF_VAR_*`

CI から `terraform apply` するなら、値は GitHub Secrets に置き、環境変数で渡す。

```yaml
env:
  TF_VAR_origin_shared_secret: ${{ secrets.ORIGIN_SHARED_SECRET }}
```

Environments（`production` / `staging`）を使うと環境ごとに値を分けられ、
承認ゲート（required reviewers）も付けられる。

### 実行時 → Secrets Manager / Parameter Store

## 注意点
env:

### state には平文で入る

