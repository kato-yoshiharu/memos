# Herdr

コーディングエージェントネイティブなターミナルマルチプレクサ。

常にサイドバーでエージェントの動き具合を確認することができる。
エージェントの動作状態は以下のようになっている。

| status  | description            |
| ------- | ---------------------- |
| Blocked | 承認や入力待ちで停止中 |
| Working | 作業中                 |
| Done    | 完了したが未確認       |
| Idle    | アイドル状態           |

デフォルトの設定では、ブロックに入ったりタスクが終了したタイミングでサウンドが鳴る。

Herdrのプラグインには以下のようなものがある。
<https://herdr.dev/plugins/>

- ファイルビューワー
- macOS自体の通知機能を使ったエージェントの状態通知

別タブで起動しているClaude Codeに、現在実行中のOpen Codeからアクセスして内容を確認することもできる。

Session > Workspace > Tab > Pane
Workspaceからはさらにgit worktreeを切ることができる。

`pane send-text`で他のペインにテキストを送信することができる。
他のペインに選択したファイル、行範囲を送信する」ということができる。

## TODO

- [ ] エージェントのセッションの復元
- [ ] git worktreeとworkspaceを紐づける？
- [ ] 待機中のコーディングエージェントのセッションに切り替えれるようにする

## 参考

- <https://blog-dry.com/entry/2026/06/30/234346>
- <https://zenn.dev/studypocket/articles/herdr-ai-agent-multiplexer>
- <https://zenn.dev/dragon1208/articles/45708cc45a7a7c>
