# DDD

## Value Object

idは利用するケースが多いので、すべてvalue objectにする(find_by_idの引数など)。

### メリット

- 意図を明確に表現できる
- value objectの中にルールを閉じ込めることでカプセル化ができる

## Entity

## Domain Service

## Repository

Repository層といったり、Infrastructure層といったりする。

mutationは、createとupdateを分ける。saveでまとめない。updateのinputの属性はオプショナルの場合があるから。

## Application Service

UseCase層。

## Controller

## DI

## 境界づけられたコンテキスト

モデルが意味を持つ範囲。その境界の外では、同じ言葉でも指すものが変わる。
## Links

- <https://github.com/nrslib/itddd>
- <https://github.com/j5ik2o/rust-ddd-rest-api-template>
