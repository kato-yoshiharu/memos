# App Router

Next.jsのルーティング方式には、App RouterとPages Routerがある。
1つのプロジェクトに共存もできる。

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

Pages Routerとの主な違い

- デフォルトがServer Component
## Server Components

Server Componentsとは、サーバー側でのみ実行されるコンポーネント。
App Routerではデフォルトで全てのコンポーネントがServer Componentになる。
クライアント側で動かしたい場合は、ファイルの先頭に`'use client'`を書いてClient Componentにする。

Server Componentsの特徴

- コンポーネント内で直接`await`できる。
- ブラウザAPI, `useState`, `useEffect`, `onClick`などは使えない。

Server ComponentからClient Componentへ渡すpropsはシリアライズ可能である必要がある。
関数はそのままでは渡せない。

## layout機能

URL階層とレイアウト階層が一致する。
ネストした場合は外側から順に入れ子になる。

