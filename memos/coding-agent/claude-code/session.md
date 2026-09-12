# セッション管理

## `/rewind` — 巻き戻す

## セッション一覧の表示・再開

- 対話中: `/resume` で一覧を表示し、選んで再開する。
- 起動時: `claude --resume`（`-r`）で一覧を表示 → 選択して再開。
- 直前のセッションをすぐ再開: `claude --continue`（`-c`）。
### 復元されないもの

- **Bash 経由のファイル変更**。`rm`・`mv`・`cp` などは追跡されない。追跡対象は編集ツールの変更だけ
## `/branch` — 分岐させる


セッションの実体は、`~/.claude/projects/<パスをエンコードしたディレクトリ>/*.jsonl` に保存される。
## 参考

- <https://code.claude.com/docs/en/sessions>
- <https://code.claude.com/docs/en/checkpointing>
