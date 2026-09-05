# フレームワーク選定

Reactアプリをどの構成で作るかの判断。
どのレンダリング戦略が要るかは[レンダリング戦略](./rendering-strategies.md)を参照。

## 判断の軸

- SEOや初期表示が事業価値に直結するページがあるか。
- チームがサーバーとクライアントの境界を扱えるか。

最初の軸で決まることが多い。SSRが要らないなら、以降は検討するまでもなくSPAでよい。

## 選択肢

| 構成                          | 対応するレンダリング戦略 |
| ----------------------------- | ------------------------ |
| Next.js                       | SSG, ISR, SSR, CSR       |
| React Router (framework mode) | SSG, SSR, CSR            |
| TanStack Start                | SSG, SSR, CSR            |
| Vite + React Router (SPA)     | CSR                      |
| Astro                         | SSG, SSR                 |

### Next.js

- ISRを持つ。
  ページ数が多くビルド時に全部生成できず、かつリクエストごとの鮮度は要らない場合に効く。React構成でこれが要るならほぼ一択。
### React Router (framework mode)

