# React Server Components

RSCは個々のコンポーネントではなくアーキテクチャ全体の名前。
コンポーネントにはServer ComponentとClient Componentの2種類がある。

サーバーはコンポーネントツリーをRSC Payloadという形式で表現する。
RSC Payloadに載るのはServer Componentのレンダリング結果と、Client Componentの参照（どのモジュールを読むか）とそのprops。
Server Component自体のコードは載らないため、クライアントに送られない。
Server ComponentからClient Componentへ渡すpropsがシリアライズ可能でなければならないのは、この形式に載せる必要があるため。

## Server Component

Server Componentとは、サーバー側でのみ実行されるコンポーネント。
RSC対応のフレームワークでは、デフォルトで全てのコンポーネントがServer Componentになる。
クライアント側で動かしたい場合は、ファイルの先頭に`'use client'`を書いてClient Componentにする。

Server Componentの特徴

- コンポーネント内で直接`await`できる。
- ブラウザAPI, `useState`, `useEffect`, `onClick`などは使えない。

## 使い分け

### Client Componentにする条件

- `useState`, `useEffect`などのhookを使う。
- `onClick`, `onChange`などのイベントハンドラを付ける。
- `window`, `localStorage`などのブラウザAPIを触る。
- Contextを使う。
- クライアント専用ライブラリを使う。

### 境界の設計

`'use client'`はそのファイルからimportするツリー全体をクライアント化するため、
ページ全体ではなくインタラクティブな部分だけを小さいコンポーネントに切り出す。

Client Componentの`children`としてなら、Server Componentを渡してもServerのまま維持される。
Provider系をルートに置いても全てがクライアントにならないのはこのため。

境界を決めるのはimportグラフであって、レンダリングツリーの親子関係ではない。
importしたものは`'use client'`を書かなくてもClient Componentになり、
propsで渡したものはレンダリングツリー上で配下にあってもServer Componentのまま。

渡した時点でサーバーでのレンダリングは終わっている。
Client Component側で`{isOpen && children}`のように条件付きで表示していても、
サーバーでは実行済みでデータ取得も走っている。「開いたときに取得」にはならない。
Client Componentのstateが変わってもServer Componentは再実行されない。
再実行にはルーターのリフレッシュやServer Actionsが要る。

### Server Componentのメリット

セキュリティ

- APIキーやDBの接続情報をコンポーネント内で直接扱える。バンドルに含まれないため漏れない。
- 認可チェックをサーバー側で完結できる。

パフォーマンス

- JSバンドルサイズ。Server Componentのコードとそこでしか使わない依存はクライアントに送られない。
  markdownパーサ、シンタックスハイライタ、日付/i18nライブラリなどで効果が大きい。
データ取得の書きやすさ

- `async`コンポーネントで直接`await`できるので、`useEffect` + loading/error stateが不要になる。

SEO・初期表示は理由にならない。Client Componentも初回はサーバーでプリレンダリングされるため。

### Server Componentのデメリット

できないこと

- state, イベントハンドラ, ブラウザAPI, Contextが使えない。
  少しでもインタラクションが要るなら結局Client Componentに切り出すことになる。
- Client Componentへ渡すpropsはシリアライズ可能でなければならない。
  関数を渡せないため、コールバックを渡す設計は使えない。Server Actionsで代替する。

運用面

- 更新のたびにサーバーへ往復するため、細かいUIの即時反映には向かない。

開発面

- 境界をどこに引くかの判断が常に付きまとう。設計の認知コストが増える。
- 多くのnpmライブラリが`'use client'`前提で書かれており、そのままでは使えないことがある。
- サーバーで実行されるためブラウザのDevToolsで追えない。ログはサーバー側に出る。
- `async`コンポーネントはReact Testing Libraryで素直にテストできず、E2Eに寄せることになる。

