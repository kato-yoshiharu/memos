# App Routerのルーティング

`app/`ディレクトリの構成がそのままURLになる。
ページの実体はファイル名ではなく、予約ファイル名で決まる。

- `page.tsx`: そのURLのページ。これが無いとルートとして公開されない。
- `layout.tsx`: 配下を包む共通レイアウト。
- `loading.tsx`: 同階層をSuspenseで包む。
- `error.tsx`: 同階層をError Boundaryで包む。
- `not-found.tsx`: `notFound()`が呼ばれたときの表示。
- `route.ts`: Route Handler。ページではなくAPIエンドポイントになる。

## layout.tsx

URL階層とレイアウト階層が一致する。
ネストした場合は外側から順に入れ子になる。

ページ遷移してもlayoutは再マウントされず、stateやスクロール位置が保持される。
遷移のたびにリセットしたい場合は`template.tsx`を使う。

## loading.tsxとerror.tsx

自分で境界コンポーネントを書いてツリーに差し込む代わりに、ファイルを置く場所で境界の範囲が決まる。

## Route Groups

`(folder)`のように括弧で囲むと、URLに含まれないディレクトリになる。

```text
app/
  (marketing)/
    layout.tsx      → /about と /pricing に適用される
## Dynamic Segments

- `[id]`: 1つのセグメントにマッチ。
