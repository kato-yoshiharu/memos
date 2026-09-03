# App Router

Next.jsのルーティング方式には、App RouterとPages Routerがある。
（1つのプロジェクトに共存もできる。）

## Pages Router

Next.js 13以前からある方式。`pages/`ディレクトリのファイル構成がそのままURLになる。

- 全てのコンポーネントがクライアント向けにバンドルされる。
- データ取得はページ単位。
  `getStaticProps`（SSG）, `getServerSideProps`（SSR）をページコンポーネントからexportして指定する。
- 共通レイアウトは`_app.tsx`で組む。
  URL階層とは独立しているため、ページごとに出し分けたい場合は`getLayout`パターンなどの工夫が要る。

## App Routerとは

Next.js 13で追加され、14以降の推奨方式。
`app/`ディレクトリを使う。
React Server Componentsを前提に作られている。

RSCをPages Routerに後付けできなかったため、ルーターごと作り直したもの。
Pages Routerはページ単位のデータフローとhydrationが前提で、コンポーネント単位のRSCと噛み合わない。
そのため`app/`という別ディレクトリで共存させる形になった。

Pages Routerとの主な違いは大きく2つ。

- RSC対応
  - デフォルトがServer Component
  - データ取得がページ単位ではなくコンポーネント単位。ページ内で戦略を混在できる。
- ルーターの改善
  - ルーティングがファイル名ではなく予約ファイル名で決まる
    （`page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`など）。
  - `layout.tsx`によってURL階層とレイアウト階層が一致する。
  - Parallel Routes / Intercepting Routesが使える。
  - 詳細は[App Routerのルーティング](./routing.md)を参照。

## React Server Components

## Server Component

Server Componentとは、サーバー側でのみ実行されるコンポーネント。
App Routerではデフォルトで全てのコンポーネントがServer Componentになる。
クライアント側で動かしたい場合は、ファイルの先頭に`'use client'`を書いてClient Componentにする。

Server Componentの特徴

- コンポーネント内で直接`await`できる。
- ブラウザAPI, `useState`, `useEffect`, `onClick`などは使えない。

Server ComponentからClient Componentへ渡すpropsはシリアライズ可能である必要がある。
関数はそのままでは渡せない。

## layout機能

URL階層とレイアウト階層が一致する。
ネストした場合は外側から順に入れ子になる。

ページ遷移してもlayoutは再マウントされず、stateやスクロール位置が保持される。
遷移のたびにリセットしたい場合は`template.tsx`を使う。
