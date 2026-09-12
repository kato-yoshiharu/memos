# セッション管理

## `/rewind` — 巻き戻す

`/rewind`、または入力欄が空の状態で `Esc` を2回押すとメニューが開く。

セッションごとに直近100個のファイルスナップショットを保持する。
スナップショットは最後に保存されてから約30日で削除される（`cleanupPeriodDays` 設定で延長可能）。

メニューで選べる操作:

- コードと会話の両方を復元（Restore code and conversation）
- 会話のみ復元、コードは今のまま（Restore conversation）
- コードのみ復元、会話は今のまま（Restore code）
- ここから先を要約、コンテキストを空ける（Summarize from here）
  - 指定時点より後を圧縮する。コンテキストを空けるためのもの
- ここまでを要約、以降のメッセージは残す（Summarize up to here）
  - 指定時点より前を圧縮する。前半が長くなった／不要になったが、直近のやり取りはそのまま残したいときに使う
- 何もしない（Never mind）

要約はセッションを移動せずコンテキストだけ圧縮する。範囲を指定した `/compact`。

`/clear` を実行した直後のセッションでは、メニュー先頭に `/resume <session-id> (previous session)` が追加され、`/clear` 前の会話に戻れる（Claude Code v2.1.191 以降）。

### 復元されないもの

- **Bash 経由のファイル変更**。`rm`・`mv`・`cp` などは追跡されない。追跡対象は編集ツールの変更だけ
- **サブエージェントの編集**。フォアグラウンドの forked skill だけは例外的に復元される
- **セッション外の変更**。手で編集したファイル、別セッションの編集
- **シンボリックリンク・ハードリンク**。スキップされ `Restored the code, but skipped N files` が出る

## `/branch` — 分岐させる

会話をそこまでコピーして、新しいセッションに切り替わる。元のセッションは無傷で残る。

```text
/branch <branch-name>
```

名前を省くと最初のプロンプトから命名される。

CLI 起動時に同じことをするなら `claude --continue --fork-session`。
直前のセッションの内容を引き継いだ新しいセッションとして立ち上がる（元のセッションはそのまま残る）。

分岐後も引き継がれるもの:

- 「このセッションでは許可」の権限（同一プロセスのため）。`--fork-session` で別プロセスにすると引き継がれない
- 実行中のバックグラウンドサブエージェント・バックグラウンド Bash。出力は分岐先に出る
- Remote Control の接続。スマホやブラウザなど別デバイスからセッションに接続して操作・確認する機能

## fork

fork は2種類ある

## 使い分け

## セッション名と再開

| 場面               | 方法                      |
| ------------------ | ------------------------- |
| 起動時             | `claude -n <session-name>` |
| セッション中       | `/rename <session-name>`   |
| セッションピッカー | 選択して `Ctrl+R`         |

再開の方法:

- 対話中: `/resume` で一覧を表示し、選んで再開する
診断は `/status` の IDE 欄、または `claude doctor` で確認できる。

## トランスクリプトの保存場所

`~/.claude/projects/<project>/<session-id>.jsonl` に JSONL で保存される。
`<project>` は作業ディレクトリのパスの英数字以外を `-` に置換したもの。

## 参考

- <https://code.claude.com/docs/en/sessions>
- <https://code.claude.com/docs/en/checkpointing>
