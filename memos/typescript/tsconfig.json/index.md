# tsconfig.json

## Init

```shell
tsc --init
```

## Options

### target

どのバージョンのJavaScriptに出力するかを設定する

### lib

実行環境で使用できるライブラリの宣言ファイルを指定する

### module

Specify module system.

#### for Node.js

`CommonJS`

#### for frontend

`ESNext`

### moduleResolution

`resolveJsonModule` cannot be specified without 'node' moduleResolution.

## Use absolute path

`tsconfig.json`

```json
{
  "compilerOptions": {
    "baseUrl": "src",
    "paths": {
      "@/*": ["*"]
    }
  }
}
```

### When using `ts-node`

```shell
yarn add tsconfig-paths -D
```

`tsconfig.json`

```json
{
  "compilerOptions": {
    "baseUrl": "src",
    "paths": {
      "@/*": ["*"]
    }
  },
  "ts-node": {
    "require": ["tsconfig-paths/register"]
  }
}
```
