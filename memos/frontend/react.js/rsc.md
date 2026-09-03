# React Server Components

RSCは個々のコンポーネントではなくアーキテクチャ全体の名前。
コンポーネントにはServer ComponentとClient Componentの2種類がある。

サーバーはコンポーネントツリーをRSC Payloadという形式で表現する。
RSC Payloadに載るのはServer Componentのレンダリング結果と、Client Componentの参照（どのモジュールを読むか）とそのprops。
Server Component自体のコードは載らないため、クライアントに送られない。
Server ComponentからClient Componentへ渡すpropsがシリアライズ可能でなければならないのは、この形式に載せる必要があるため。

## Server Component

