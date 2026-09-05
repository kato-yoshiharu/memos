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

- `loading.tsx`: 同階層の`page.tsx`をSuspenseで包み、その中身をfallbackにする。
  Server Componentの`await`が終わるまで表示され、準備できた部分からストリーミングで流れる。
- `error.tsx`: 同階層をError Boundaryで包む。Client Componentである必要がある。
  `reset`関数を受け取り、再レンダリングを試せる。
  - 同階層の`layout.tsx`のエラーは捕捉できない。1つ上の階層の`error.tsx`が受ける。
  - ルートレイアウトのエラーは`global-error.tsx`で受ける。

境界がURL階層と一致するため、`/dashboard/settings`で失敗しても`/dashboard`のレイアウトは残る、といった挙動になる。

## Route Groups

`(folder)`のように括弧で囲むと、URLに含まれないディレクトリになる。

```text
app/
  (marketing)/
    layout.tsx      → /about と /pricing に適用される
    about/page.tsx  → /about
    pricing/page.tsx→ /pricing
  (app)/
    layout.tsx      → /dashboard に適用される
    dashboard/page.tsx
```

URL階層を変えずにレイアウトを分けたいときに使う。
ログイン前後でレイアウトを変える、といったケース。

## Dynamic Segments

- `[id]`: 1つのセグメントにマッチ。
- `[...slug]`: 残り全てにマッチ（catch-all）。
- `[[...slug]]`: セグメントが無い場合にもマッチ（optional catch-all）。

