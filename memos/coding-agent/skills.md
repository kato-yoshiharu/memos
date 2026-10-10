# Skills

skillsとは `/コマンド名` で呼び出せるワークフロー定義

## スキル一覧

### 調査

- `deep-research`（ECC）
- `find-skills`
  — スキルを探して導入する

### ドキュメント

- `natural-japanese`
- `yomiyasu`

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
- `vercel-react-best-practices`
  — React / Next.js の性能指針

### 設計・計画

- grill-skills(`grill-with-docs`, `grill-me`)
  [grilling / grill-me / grill-with-docs の違い](grill-skills.md)
- `domain-modeling`
  — ドメインモデル、GLOSSARY.md、ADR を整える

### テスト・デバッグ

- `/qa`（gstack）
  — 変更から影響ページを特定し、ブラウザテスト実行からバグ修正まで行う
- `tdd-workflow`（ECC）

### リリース・デプロイ

- [ ] `/ship`（gstack）
- [ ] `/land-and-deploy`（gstack）

### 自動実行・並列化

- `/loop`（組み込み）
- `/schedule`（組み込み）
- `/batch`

### ハーネスエンジニアリング

- `/init`（組み込み）
- `/update-config`（組み込み）
  — settings.json の permissions / env / hooks を設定する
- `/fewer-permission-prompts`（組み込み）
  — 権限確認ダイアログが出る頻度を減らす
- `harness-creator`
  — AGENTS.md・検証ゲート・セッション引き継ぎなど、エージェントを安定させる枠組みを作り、監査・改善する
- `claude-automation-recommender`
  — コードベースを分析し、Claude Code の自動化（hooks・サブエージェント・スキル・プラグイン・MCP サーバー）を推奨する
- `/doctor`（組み込み）
  — セットアップ全体を診断し、確認後に修正する。
  - [/doctor の詳細](doctor.md)

### コンテキスト・コスト最適化

- `context-budget`（ECC）
- `cost-aware-llm-pipeline`（ECC）
- `agentic-engineering`（ECC）
  — 評価先行・タスク分解・コストを考慮したモデルの振り分けで、エージェントに作業を進めさせる
- `agent-eval`（ECC）
  — コーディングエージェントの比較評価
- `eval-harness`（ECC）
  — 評価駆動開発の枠組み
- `context-engineering`
  — エージェントのコンテキスト設計

### その他

- `shot-annotate`（shot-annotate）
  — スクリーンショットに赤枠・矢印・線・楕円・テキストラベルで注釈を付ける。
- `i-have-adhd`
  — ADHD 向けの応答スタイル

## スキルを作成する

決定的な処理はスクリプトで行わせる

SKILL.md の description は Claude Code が読み、文脈に合えば `/スキル名` を明示しなくても自動で使われる

## Skillsを見つける

- <https://skillsmp.com/ja>
- <https://www.skills.sh/>
