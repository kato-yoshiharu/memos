# Skills

skillsとは `/コマンド名` で呼び出せるワークフロー定義

## スキル一覧

配布元:
gstack = <https://github.com/garrytan/gstack>
ECC = <https://github.com/affaan-m/ECC>
uupm = <https://github.com/nextlevelbuilder/ui-ux-pro-max-skill>
shot-annotate = <https://github.com/commte/shot-annotate>
mattpocock = <https://github.com/mattpocock/skills>

### レビュー・品質

- `/code-review`（組み込み）
  — 現在の差分・PR・ブランチをレビューする。
    effort（low〜max, ultra）を指定でき、`--comment` でPRにインラインコメント、`--fix` で修正を適用
- `/security-review`（組み込み）
  — 現在のブランチの変更に対してセキュリティレビューを行う
- `/simplify`（組み込み）
  — 変更箇所の再利用・簡略化・効率化の観点で修正まで行う（バグ探しはしない）
- `/plan-eng-review`（gstack）
  — EM 目線でアーキテクチャ・障害モード・システム設計をレビューする
- `shot-annotate`（shot-annotate）
  — スクリーンショットに赤枠・矢印・線・楕円・テキストラベルで注釈を付ける。

### 設計・計画

- `grilling`（mattpocock）
  — 実装前に、計画・設計の未決定事項や隠れた前提を1問ずつ問い詰めて洗い出す。
    文脈に合えば自動で発動する

### デザイン

- `ui-ux-pro-max`（uupm）

### テスト・デバッグ

- `/qa`（gstack）
  — 変更から影響ページを特定し、ブラウザテスト実行からバグ修正まで行う
- `tdd-workflow`（ECC）

### リリース・デプロイ

- `/ship`（gstack）
- `/land-and-deploy`（gstack）

### 自動実行・並列化

- `/loop`（組み込み）
- `/schedule`（組み込み）
- `/batch`

### 設定・環境

- `/init`（組み込み）
- `/update-config`（組み込み）
  — settings.json の permissions / env / hooks を設定する
- `/fewer-permission-prompts`（組み込み）
  — 権限確認ダイアログが出る頻度を減らす

### コンテキスト・コスト最適化

- `context-budget`（ECC）
- `cost-aware-llm-pipeline`（ECC）
- `agentic-engineering`（ECC）
- `agent-eval`（ECC）

### ドキュメント・調査・執筆

- `/claude-api`（組み込み）
  — Claude API / SDK のリファレンス（モデル ID・料金など）を参照する
- `deep-research`（ECC）
- `article-writing`（ECC）

### チーム・プロダクト

- `/retro`（gstack）
  — コミット履歴から週次振り返りをコントリビューター別に生成する

## スキルを作成する

決定的な処理はスクリプトで行わせる

SKILL.md の description は Claude Code が読み、文脈に合えば `/スキル名` を明示しなくても自動で使われる

## Skillsを見つける

- <https://skillsmp.com/ja>
- <https://www.skills.sh/>
