# Backlog.md

## 概要

GitリポジトリのタスクをMarkdownで管理するCLIツール。
1タスク = 1つの `.md` ファイルで、リポジトリ内の `backlog/` に置く。
Markdownファイルだけで完結するので、IssueをGitHub Issueではなくgit管理したい場合に使う。

## 機能

- Kanban
  ターミナル（`backlog board`）とWeb UI（`backlog browser`、ドラッグ&ドロップ対応）で表示できる
- 受け入れ基準（AC）
- Definition of Done: どのタスクでも毎回確認する完了チェックリスト
  - 設定ファイルの `definition_of_done` に書くと、新しく作るタスクすべてに自動で付く
  - 特定のタスクだけに足すときは `--dod "項目"` を使う
- マイルストーン
- 依存関係
  - 依存先を持つタスクの詳細には `Depends on` 、依存先になっているタスクの詳細には `Dependents` が出る
  - 設定は `--dep <タスクID>`
- 検索
  - `backlog search` で、タスク・ドキュメント（`backlog/docs/`）・decision（`backlog/decisions/`）をあいまい検索できる
    - decision は、タスクとは別に管理する決定の記録。`backlog decision create <title>` で作る
- AI連携

## 使い方

リポジトリのルートで初期化する:

```bash
backlog init
```

ボードと検索のコマンド:

```bash
backlog board
backlog browser
backlog search "キーワード"
```

`AGENTS.md` などの指示ファイルに、Backlog.mdの案内文を書き込む:

```bash
backlog agents --update-instructions
```

## 参考

- <https://github.com/MrLesk/Backlog.md>
- <https://github.com/MrLesk/Backlog.md/blob/main/ADVANCED-CONFIG.md>

## TODO

- [ ] GitHub Issueとの違い
