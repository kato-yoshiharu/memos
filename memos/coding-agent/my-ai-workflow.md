# My AI Workflow

開発工程ごとに、Coding Agentをどのように利用して開発を行うかのメモ。
基本方針としては、AIにまずやらせて、人間はそれに対しての意思決定と妥当性の評価を行う。

人間の役割:

- 意思決定
- 開発のワークフローの整備と評価
- 最終的なコードのレビューとそれに対しての責任を持つこと

## 要件整理・Issue作成

grill-with-docs skillを使ってIssueを作成する。
ゴールは、別セッションのAIが単体で実装できる内容にすること。

skillは以下のプロンプトで呼び出す。
<!-- MEMO: 以下のプロンプトで呼び出すskillを作ってもよさそう -->

```text
/grill-with-docs

こちらのIssueの要件定義をお願いします。

xxx

ゴールは、このIssueの説明欄に、事情を知らないAIエージェントが詳細な実装計画を作れるだけの情報を記載する事です。
```

## 実装計画・実装

<!-- TODO: <https://zenn.dev/avaintelligence/articles/dont-outsource-understanding-to-ai> -->
<!-- の記事に実装計画のテンプレートがあるので、実際に実装計画を作成する際に参考にしようと思う -->

Issueをもとに実装計画を作成し、サブエージェントによるレビュー・改善のループを回したあと、人間が確認します。
実装計画をもとに、新しいセッションで実装し、実装後も同様にサブエージェントによるレビュー・改善ループを回しています。

## 調査

技術選定などの調査には、deep-researchのSkillを使っています。
セキュリティや実装コストなどの比較の観点を指定し、信頼できるソースを明記させます。

## 図解・図で説明する

<!-- TODO: explain-visually skillを使ってみる -->

以下のskillを使っている

- eli5
- archify
- explainer

ゴールは`自分の言葉で説明できるようにする`

## テスト

固まった仕様を受け入れ条件（Given-When-Then）の形に落とし、そのままテストコードの下敷きにする
実装後に、型チェック・Lint・テストを自分で走らせて自己修正させるループを組み、テストがグリーンになるまでは完了扱いにしない運用にしている

<!-- TODO -->

## リファクタリング

<!-- TODO -->

## コードレビュー

機械的に判定できるものはAI、判断が要るものは人間、という分け方にしている。

- AIのレビュー対象
  - コード規約に違反していないか
  - 設計方針に違反していないか

- 人間のレビュー対象
  - 仕様や機能要件を満たしているか

最後に、人間がコード全体を一通り確認する。自分の言葉で説明できない状態ではreview readyにしない。

自分でもPRをあげる前にAIによるセルフレビューを行っている。

批判的にレビューさせるサブエージェント Devil's Advocate を作成し、レビューさせている。

### Devil's Advocate（反対意見役）でセルフレビューする

- [ ] <https://zenn.dev/correlate_dev/articles/devils-advocate-ai-team>
- [ ] <https://github.com/alirezarezvani/claude-skills/blob/main/c-level-advisor/executive-mentor/agents/devils-advocate.md>

### TODO

- [ ] <https://zenn.dev/kauche/articles/e051583461c181>
- [ ] <https://ai.acsim.app/articles/introducing-self-merge-policy>

<!-- TODO: AIレビューskill -->

脆弱性

## バグ修正

<!-- TODO -->

## モデル・Effortの使い分け

- effortは、通常時はmedium、単純作業はlow、詰まったらhighにする
- highで2回詰まれば上位モデルに切り替える
- 検索はSonnet・Haiku、編集はOpus

## AIに任せない領域

- 取り返しがつかないもの
  - 本番データを扱う操作
- 間違いをテストで検出できないもの
  - 認証・認可、秘匿情報の取り扱いといったセキュリティに直結する実装

## git worktreeによる並列開発

git worktreeで作業ツリーを複数用意し、AI Coding Agentを並列で走らせています。
ポート番号やDockerコンテナ名が衝突しないよう、環境変数ひとつで分離できるローカル開発環境を整備するskillを作成しました。

## 参考

- [AIに丸投げしないで理解するためのAI開発手法（2026年8月現在）](https://zenn.dev/avaintelligence/articles/dont-outsource-understanding-to-ai)
- [俺のAIプログラミング手法(2026/10/05)](https://zenn.dev/mizchi/articles/ai-coding-loop-formal)

## TODO

- AIのワークフローのベンチマークの計測
- adr-driven-development.md
