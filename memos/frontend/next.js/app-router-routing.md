# App Routerのルーティング

`app/`ディレクトリの構成がそのままURLになる。
ページの実体はファイル名ではなく、予約ファイル名で決まる。

- `page.tsx`: そのURLのページ。これが無いとルートとして公開されない。
- `layout.tsx`: 配下を包む共通レイアウト。
- `loading.tsx`: 同階層をSuspenseで包む。
- `error.tsx`: 同階層をError Boundaryで包む。
- `not-found.tsx`: `notFound()`が呼ばれたときの表示。
- `route.ts`: Route Handler。ページではなくAPIエンドポイントになる。

