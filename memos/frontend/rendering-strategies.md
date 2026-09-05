# レンダリング戦略

HTMLを「いつ」「どこで」生成するかの違い。

## SSG

Static Site Generation。
ビルド時にHTMLを生成しておく。

- リクエスト時はCDNから静的ファイルを返すだけなので、最も速く、サーバーコストも低い。
- 内容を変えるにはリビルドが必要。

ブログ、コーポレートサイトなど。

## ISR

Incremental Static Regeneration。
SSGしたHTMLを、一定時間後にバックグラウンドで再生成する。

ECの商品ページ、ニュース一覧など、更新はあるが秒単位の鮮度は要らないもの。

## SSR

Server Side Rendering。
リクエストごとにサーバーでHTMLを生成する。

在庫や価格のように鮮度が要るもの。

## CSR

Client Side Rendering。
