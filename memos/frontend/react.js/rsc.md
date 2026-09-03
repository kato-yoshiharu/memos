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
