# セッション管理

## `/rewind` — 巻き戻す

`/rewind`、または入力欄が空の状態で `Esc` を2回押すとメニューが開く。

セッションごとに直近100個のファイルスナップショットを保持する。
スナップショットは最後に保存されてから約30日で削除される（`cleanupPeriodDays` 設定で延長可能）。

メニューで選べる操作:

- コードと会話の両方を復元（Restore code and conversation）
- 会話のみ復元、コードは今のまま（Restore conversation）
- コードのみ復元、会話は今のまま（Restore code）
### 復元されないもの

- **Bash 経由のファイル変更**。`rm`・`mv`・`cp` などは追跡されない。追跡対象は編集ツールの変更だけ
## `/branch` — 分岐させる


セッションの実体は、`~/.claude/projects/<パスをエンコードしたディレクトリ>/*.jsonl` に保存される。
## 参考

- <https://code.claude.com/docs/en/sessions>
- <https://code.claude.com/docs/en/checkpointing>
