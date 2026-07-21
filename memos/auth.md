# Auth

## idToken と accessToken の違い

| 項目     | idToken                                             | accessToken                         |
| -------- | --------------------------------------------------- | ----------------------------------- |
| 目的     | 認証（誰であるか）                                  | 認可（何ができるか）                |
| 用途     | クライアントがユーザー情報を取得する                | APIリソースへのアクセス権を証明する |
| 受取人   | クライアントアプリ                                  | バックエンドAPI（リソースサーバー） |
| 規格     | OIDC (OpenID Connect)                               | OAuth 2.0                           |
| 含む情報 | ユーザーのプロフィール情報（name, email, sub など） | スコープ、権限、有効期限など        |

### idToken

idToken はログインしたユーザーが誰かを確認するためのもの。

**発行タイミング:** ユーザーがログインに成功したときに認可サーバーから発行される。

**使われ方:**

```
1. ユーザーが「Googleでログイン」ボタンを押す
2. 認可サーバー（Google / Entra ID など）でログイン完了
3. クライアントが idToken（JWT）を受け取る
4. クライアントが idToken をデコードしてユーザー情報を取り出す
```

### accessToken

accessToken はAPIを呼ぶときに `Authorization: Bearer <token>` として送るもの。クライアントは中身を読む必要がない。

**発行タイミング:** idToken と同じタイミング（ログイン成功時）に発行される。スコープ（`openid profile api://xxx/.default` など）に応じて、アクセスできるリソースが決まる。

**使われ方:**

```
1. ログイン後、クライアントが accessToken を保持する
2. バックエンドAPIを呼ぶ際に Authorization ヘッダーに付与する
   GET /api/foo
   Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5...
3. バックエンドが accessToken を検証し、正当であればデータを返す
   → 誰がどのリソースにアクセスできるかを判断するのはバックエンド側
```

<!-- TODO -->
