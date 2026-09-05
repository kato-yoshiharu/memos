# Next.js

SSR/SSG/ISRとルーティングを備えたReactのフレームワーク。

他の構成と比べてどうかは、[フレームワーク選定](../framework-selection.md)を参照。

### URL系

Dynamic Segmentを取得したい場合は`useParams`を使う。

例えば、`/blog/[slug]`というURLのパスから`[slug]`を取得したい場合は、

```tsx
const params = useParams();
console.log(params.slug);
```

で取得できる。
