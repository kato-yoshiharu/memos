# App Router

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
