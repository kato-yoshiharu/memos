# Subagents(サブエージェント)

- subagents
- agent view
- agent teams
- dynamic workflows

/batch は、1つの大きな変更を5~30個のワークツリー分離サブエージェントに分割し、各エージェントがプルリクエストを作成したい場合に使用する。

複数のセッションまたはサブエージェントを同時に実行すると、トークン使用量が増加する。

## Subagents

コンテキストウィンドウの汚染を防ぐことができる。
動作を特化することができる。
動作の制限を設けることができる。
タスクに応じてコストを最適化させることができる。

## 標準のエージェント

- Explore
- Plan
- General-purpose
  - 調査しながら実装を行う

## アプローチの選択

<https://code.claude.com/docs/ja/agents#choose-an-approach>

## TODO

- git worktreeとclaude codeのworktreeの違い
