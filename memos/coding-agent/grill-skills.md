# grilling / grill-me / grill-with-docs の違い

## 3つの位置づけ

| スキル            | 呼び出し               | 役割                                | 出力                     |
| ----------------- | ---------------------- | ----------------------------------- | ------------------------ |
| `grilling`        | モデルが自動で呼ぶ     | インタビュー手法そのもの（土台）    | なし                     |
| `grill-me`        | ユーザーが明示的に呼ぶ | `grilling` を単体で使う             | なし（セッション内のみ） |
| `grill-with-docs` | ユーザーが明示的に呼ぶ | `grilling` にドキュメント更新を足す | ファイルを更新する       |

## grilling

公式ドキュメントでの定義:

> `grilling` is the interview loop that stress-tests a plan, a decision, or an idea before anyone acts on it.

ほかのスキルが内部で呼ぶ土台で、インタビューの実装をここに一本化している。
grilling ファミリーで唯一のモデル呼び出しなので、直接打つことは少ない。

`grilling` を土台にしているスキル:

- grill-me
- grill-with-docs
- triage
- wayfinder
- improve-codebase-architecture

### インタビューの進め方

grillingが行うインタビューの手順:

1. 対象の決定事項と、その依存関係を設計ツリーとして洗い出す
2. 前提がすでに解決済みで、今すぐ答えられる質問（フロンティア）を集める
3. フロンティアの質問を、番号付きで1ラウンドにまとめて、推奨回答つきで聞く
4. ユーザーの回答でツリーが変わり、新しくフロンティアに入った質問を次のラウンドで聞く
5. フロンティアが空になったら終了する。すべての枝を調べ終え、仮定のまま残したものがない状態にする
6. 行動に移る前に、共有した理解をユーザーに確認する

事実（コードに何があるかなど）はサブエージェントに調べさせる。
ユーザーに聞くのは決定事項だけ。

## grill-me

grillingのインタビューを、そのまま実行する。
作業ディレクトリは不要で、ファイルは作らない。結果はセッション内に残るだけ。
曖昧なアイデアの段階でも使える。

## grill-with-docs

grillingのインタビューを実行しながら、確定した内容をリポジトリのファイルに書き込む。
質問や回答の中で、コードベースの用語や既存の決定を参照する。

更新するファイル:

- 用語集（`GLOSSARY.md`）: 用語が確定した時点で、その場で追記する。
  語彙の定義だけを置き、実装の詳細は書かない。
  複数コンテキストのリポジトリでは、ルートの `GLOSSARY-MAP.md` で管理する
- ADR（`docs/adr/`）: 次の3条件をすべて満たす決定だけを残す。1つでも欠けたら書かない。

ADRを書く3条件:

- 覆すのが難しい: 後から考えを変えるコストが大きい
- 文脈なしでは意外と思うこと: 将来の読み手が「なぜこうしたのか」と疑問に思う
- 本物のトレードオフがある: 実際に選択肢があり、特定の理由で1つを選んだ

ほとんどの決定は3条件を満たさないので、ADRが作られないセッションも多い。

## 参考

- <https://github.com/mattpocock/skills>
- <https://github.com/mattpocock/skills/blob/main/docs/productivity/grilling.md>
- <https://github.com/mattpocock/skills/blob/main/docs/engineering/grill-with-docs.md>
- <https://github.com/mattpocock/skills/blob/main/skills/engineering/domain-modeling/SKILL.md>
