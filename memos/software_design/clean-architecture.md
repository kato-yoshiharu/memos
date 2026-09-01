# クリーンアーキテクチャ

## 概要

ビジネスルールが技術に依存しないようにする。

- 依存の向きは常に内向き。ビジネスルールはFWもDBも知らない
- 内向きにできない場合は、インターフェースを内側に置いて依存を逆転させる(DIP)

### 何が嬉しい

- 「どこに何を書くか」が依存の向きで機械的に決まる
- DB、FW、UIを差し替えても、変更が外側に閉じる
- テスタビリティ
  - ビジネスルールのテストにFWなどが必要なく、集中できる

### コスト

層の数に応じて変換のためのコードが増える。
規模と寿命によっては、分離で得られるものより変換のコストが上回るので、そのときは層をまとめる。

## 依存性のルール

依存は常に外側から内側の一方向のみ。内側は外側を知らない。

```text
Entities <- Use Cases <- Interface Adapters <- Frameworks & Drivers
```

- Entities
  - ビジネスルール。
- Use Cases
  - 機能。アプリケーション固有のルールである。
- Interface Adapters
  - Controller(Handler)、Presenter、Gateway(Repositoryの実装)
  - 外側（HTTPやDB）の形式と、内側のモデルを相互に変換する
- Frameworks & Drivers
  - Webフレームワーク、DB、外部API

## 実装上の層の呼び方

実プロジェクトでは、次の4層の名前がよく使われる。

- Domain
  - 値オブジェクト、エンティティ
- Application
  - ユースケース。Repositoryのインターフェース
- Infrastructure
  - Repositoryの実装。DB、外部API、ファイルシステム
- Presentation
  - HTTP、CLIなどのUI。リクエスト/レスポンスの処理

| 原典                 | 実装上の呼び方                     |
| -------------------- | ---------------------------------- |
| Entities             | Domain                             |
| Use Cases            | Application                        |
| Interface Adapters   | Presentation + Infrastructure      |
| Frameworks & Drivers | (依存ライブラリ。コードにならない) |

4という数に決まりはない。原典の同心円も図式にすぎず、守るべきは依存の向きだけ。

### 層とディレクトリの関係

層の数は、依存の向きに規約がある境界がいくつあるかで数える。
層の数とディレクトリの数が一致しているとは限らない。

例えば、handlers/とrepository/を分けても、両者の間に向きに関する規約がなければ、
どちらも「domainの外側」という同じ位置なので、ディレクトリが3つでも2層になる。

とはいえ、実践としては層とディレクトリを1対1で対応させるべきである。

### 層の数の選び方

「変更理由がいくつあるか（SRP）」と「そのコードの寿命」で決まる。
規模が大きいほど変更理由も増えやすいので判断材料にはなるが、規模だけでは決まらない。

- Domain を切るか
  - ビジネスルールが複雑なら切る価値がある
2層(Domain / Handler):

- ドメインロジックが薄く、処理の大半がDBの読み書きに終始する
- Use Caseを分けてもControllerからRepositoryを呼ぶだけの委譲になる場合

3層(Domain / Application / Infrastructure):

- PresentationがHTTPひとつだけで、Infrastructureと分ける動機が薄い
  - そもそもPresentationは広義のInfrastructure。
    原典でもController、Presenter、Gatewayは同じInterface Adapters層にあり、どちらも外部世界との変換という同じ役割。
    逆に、入口が複数(HTTP、CLI、キューのconsumer)ある場合はPresentationを分ける4層の方がよい。

## 依存性逆転(DIP)

詳細は[SOLID原則](./solid.md)を参照。

## 境界をまたぐときのルール

- Presentation ↔ Use Case
  - ControllerはInput Portを呼ぶだけにし、結果はOutput Portか戻り値で返す
- Use Case ↔ Infrastructure
  - 内側に置いたRepositoryのインターフェースを介する(DIP)

どちらの境界でも、やり取りするデータは次のようにする。

- 層をまたぐときは、内側で定義したDTOで受け渡す
- 外側の型(ORMのエンティティ、HTTPのリクエスト/レスポンス型など)を内側に持ち込まない

### DTO（Data Transfer Object）

境界をまたいでデータを運ぶだけの構造体。
## トランザクション境界

## SOLID原則との関係

クリーンアーキテクチャは、SOLIDをコンポーネント/アーキテクチャの粒度に広げたもの。
対応するのは主にDIPとSRP。

[SOLID原則](./solid.md)

## DDDとの関係

クリーンアーキテクチャは依存の向きを決めるもので、内側に何を書くかは決めていない。
DDDは、その内側をどう作るかを扱う。
組み合わせて使われることが多い。
