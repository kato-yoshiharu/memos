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

ルーターの改善の詳細は[App Routerのルーティング](./routing.md)を参照。

## App RouterかPages Routerか

新規プロジェクトでは App Router を選ぶ。Pages Router は基本的に既存プロジェクトの保守用途。

App Router が向くケース

- サーバー側でデータを取得してHTMLを返したい（Server Componentで直接`await`できる）。
- URL階層に沿った共通レイアウトを自動で持たせたい。
- SSR/SSG/ISRをデータ取得単位で使い分けたい。

App Router でなくてもよいケース

## React Server Components

RSCは個々のコンポーネントではなくアーキテクチャ全体の名前。
コンポーネントにはServer ComponentとClient Componentの2種類があり、
境界は`'use client'`で宣言する。これはサーバーとクライアントのモジュールグラフの境界。
境界の引き方とServer Componentを選ぶ理由は[使い分け](#使い分け)を参照。

サーバーはコンポーネントツリーをRSC Payloadという形式で表現する。
RSC Payloadに載るのはServer Componentのレンダリング結果と、Client Componentの参照（どのモジュールを読むか）とそのprops。
Server Component自体のコードは載らないため、クライアントに送られない。
Server ComponentからClient Componentへ渡すpropsがシリアライズ可能でなければならないのは、この形式に載せる必要があるため。

クライアント遷移時はHTMLではなくPayloadだけを取得する。
Server Componentは再レンダリング結果だけが届き、コードは送られない。
変わったセグメントだけが差し替わり、上位の`layout.tsx`は再レンダリングされない。

## Server Component

Server Componentとは、サーバー側でのみ実行されるコンポーネント。
App Routerではデフォルトで全てのコンポーネントがServer Componentになる。
クライアント側で動かしたい場合は、ファイルの先頭に`'use client'`を書いてClient Componentにする。

Server Componentの特徴

- コンポーネント内で直接`await`できる。
- ブラウザAPI, `useState`, `useEffect`, `onClick`などは使えない。

Server ComponentからClient Componentへ渡すpropsはシリアライズ可能である必要がある。
関数はそのままでは渡せない。

## レンダリングの種類

URL階層とレイアウト階層が一致する。
ネストした場合は外側から順に入れ子になる。

ページ遷移してもlayoutは再マウントされず、stateやスクロール位置が保持される。
遷移のたびにリセットしたい場合は`template.tsx`を使う。
