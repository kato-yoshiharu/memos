# karabiner

## fn+hjkl でのカーソル移動 (vim-like)

| キー                    | 動作                             |
| ----------------------- | -------------------------------- |
| `fn+h/j/k/l`            | 矢印キー（左/下/上/右）          |
| `shift+fn+h/j/k/l`      | shift+矢印（選択拡張）           |
| `cmd+fn+h/l`            | 行頭/行末へ移動                  |
| `cmd+fn+j/k`            | 文書末尾/先頭へ移動              |
| `shift+cmd+fn+h/l`      | 行頭/行末までの選択拡張          |
| `shift+cmd+fn+j/k`      | 文書末尾/先頭までの選択拡張      |
| `control+fn+f`          | Page Down（vimの`Ctrl+f`相当）   |
| `control+fn+b`          | Page Up（vimの`Ctrl+b`相当）     |

## 設定反映されないときの対処

`karabiner.json` をシンボリックリンク経由で編集した場合、デーモン（`core_service`）のファイル監視が変更を検知せず、設定画面上は反映されて見えても実際のキー変換には反映されないことがある。

以下で強制的にリロードできる。

```sh
karabiner_cli --select-profile Default
```

反映状況は `/var/log/karabiner/core_service.log` の `Load .../karabiner.json...` のタイムスタンプで確認できる。
