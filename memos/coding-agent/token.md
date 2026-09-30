# トークン消費を抑える

## トークンとは

LLM がテキストを処理する最小単位。単語そのものではなく、単語の一部や記号に分割される。
日本語は英語より多く消費しやすい。
課金やレート制限の基準になる。

## コンテキストウィンドウとは

モデルが一度に保持・参照できるトークンの上限。「作業机の広さ」のイメージ。

コンテキストウィンドウには以下の入力+出力の情報が含まれている。

- Claude Codeとの会話
- 読み込んだファイル
- 実行結果
- CLAUDE.mdの内容

上限を超えると古い情報が押し出される（忘れる）か、エラーになる

## トークンを消費するとどうなる

- トークン量に応じて課金される
- 一定時間あたりのトークン量に上限がある
- 文脈が大きいほど処理に時間がかかる
- 上限に近づくと古い情報が押し出され、忘れたり精度が落ちたりする
- 上限に近づくと会話が自動で要約（compact）される

## 消費を抑える工夫

- `/compact`: 会話を要約して圧縮し、空き容量を増やす
- `/clear`: 文脈をリセットして新しいタスクを開始する
- 必要なファイルだけ読む（大きなファイルは範囲指定で部分読み込み）
- CLAUDE.md を簡潔に保つ（毎ターン読み込まれるので肥大化に注意）
- 長い実行結果を避ける（grep やフィルタで絞り込む）

## 使用量を確認する

- Claude Code の statusline: stdin の JSON に使用量が入る
  - `rate_limits.five_hour` / `rate_limits.seven_day` に入る
    - `used_percentage`: 0〜100
    - `resets_at`: Unix 秒
  - Pro / Max 契約者向けで、セッション最初の API 応答後に入る
  - `context_window.used_percentage` はコンテキストの使用率
- Codex の status_line: 組み込み項目を並べる
  - `five-hour-limit` / `weekly-limit` / `context-used` / `used-tokens` など

### ccusage

ローカルの会話ログからトークン数を集計する CLI。

### 参考

- Claude Code statusline: <https://code.claude.com/docs/en/statusline>
- ccusage: <https://github.com/ryoppippi/ccusage>
