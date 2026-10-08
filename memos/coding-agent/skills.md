# Skills

skillsとは `/コマンド名` で呼び出せるワークフロー定義

## スキル一覧

### 説明

- `eli5`（[claude-plugins-community](https://github.com/anthropics/claude-plugins-community/tree/main/eli5)）
- `archify`（[tt-a1i/archify](https://github.com/tt-a1i/archify)）
- `explainer`（[mizchi/explainer](https://github.com/mizchi/explainer)）

参考: <https://blog.lai.so/eli5-archify-explainer-skills/>

### レビュー・品質

- `/code-review`（組み込み）
  — 現在の差分・PR・ブランチをレビューする。
- `/security-review`（組み込み）
  — 現在のブランチの変更に対してセキュリティレビューを行う
- `/simplify`（組み込み）
  — 変更箇所の再利用・簡略化・効率化の観点で修正まで行う（バグ探しはしない）
- `/plan-eng-review`（gstack）
  — EM 目線でアーキテクチャ・障害モード・システム設計をレビューする
- `shot-annotate`（shot-annotate）
  — スクリーンショットに赤枠・矢印・線・楕円・テキストラベルで注釈を付ける。

### 設計・計画

- grill-skills(`grill-with-docs`, `grill-me`)
  [grilling / grill-me / grill-with-docs の違い](grill-skills.md)

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

## スキルを作成する

決定的な処理はスクリプトで行わせる

SKILL.md の description は Claude Code が読み、文脈に合えば `/スキル名` を明示しなくても自動で使われる

## Skillsを見つける

- <https://skillsmp.com/ja>
- <https://www.skills.sh/>
