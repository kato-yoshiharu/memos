# Backlog.md

## 概要

GitリポジトリのタスクをMarkdownで管理するCLIツール。
1タスク = 1つの `.md` ファイルで、リポジトリ内の `backlog/` などに置く。
Markdownファイルだけで完結する。

issueをgithub issueではなくgit管理したい場合に便利そう。

## 機能

- Kanbanをターミナル（`backlog board`）とWeb UI（`backlog browser`、ドラッグ&ドロップ対応）で表示できる
- 受け入れ基準（AC）
- Definition of Done: どのタスクでも毎回確認する完了チェックリスト
  - 設定ファイルの `definition_of_done` に書くと、新しく作るタスクすべてに自動で付く
  - 特定のタスクだけに足すときは `--dod "項目"` を使う
- マイルストーン
- 依存関係
  - 依存先を持つタスクの詳細には `Depends on` が出る
  - 設定は `--dep <タスクID>`
- `backlog search` で、タスク・ドキュメント（`backlog/docs/`）・decision（`backlog/decisions/`）をあいまい検索できる
  - decision は、タスクとは別に管理する決定の記録。`backlog decision create <title>` で作る
- `--no-git` でGitなしでも使える

## AI連携

Claude Code、Codex、Gemini CLI、Kiro、Cursor などに対応する。
`backlog init` のウィザードで接続方法を選ぶ。

## 参考

- <https://github.com/MrLesk/Backlog.md>
- <https://github.com/MrLesk/Backlog.md/blob/main/ADVANCED-CONFIG.md>

## TODO

- [ ] GitHub issueとの違い
