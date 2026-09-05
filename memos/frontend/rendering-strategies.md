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

## SSR

Server Side Rendering。
## CSR

Client Side Rendering。
