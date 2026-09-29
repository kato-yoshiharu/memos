# loop engineering ループエンジニアリング

## 概要

プロンプトエンジニアリングをやめ、**AIがプロンプトを打つシステム自体を設計する**というループエンジニアリングを行う。

- Prompt Engineering
- Context Engineering
- Harness Engineering
- Loop Engineering

## 6つのコアモジュール

### Automations

定期実行 or イベント駆動で、タスクを拾い上げる役

### Worktrees

複数のエージェントを並行で走らせるための分離レイヤー

### Skills

### Sub-agents

コードを書くエージェントは、ほぼ確実に自分に高得点を付けるので、レビュー用のエージェントを作る。

| エージェント | 担当タスク                         | 推奨モデル   |
| ------------ | ---------------------------------- | ------------ |
| Explorer     | 実装に必要な情報を事前にかき集める | 高速モデル   |
| Implementer  | 実装する                           | 主力モデル   |
| Verifier     | 実装を検証・レビューする           | 別モデル推奨 |

Verifier にあえて別モデルを使うのがポイント。同じモデルは思考パターンも同じなので、Implementer が見落とした箇所をそのまま見落としてしまう。

### Connectors

MCP

### Memory

会話の外にあるあらゆる状態記憶。

## ループの作成方法
