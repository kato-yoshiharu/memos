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
  - Controller、Presenter、Gateway(Repositoryの実装)。
- Frameworks & Drivers
