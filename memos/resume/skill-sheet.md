# スキルシート

## プロフィール

| key      | value                                  |
| -------- | -------------------------------------- |
| 氏名     | 加藤 義晴                              |
| 生年月日 | 1995年                                 |
| 最終学歴 | 名城大学理工学部メカトロニクス工学科卒 |
| 居住地   | 愛知県                                 |
| GitHub   | <https://github.com/kato-yoshiharu>    |
| Zenn     | <https://zenn.dev/suimenkathemove>     |

## スキル

- 言語
  - TypeScript/Rust/Go
- フレームワーク
  - React.js/Next.js/Axum/Echo
- DB
  - PostgreSQL/DynamoDB
- API Protocol
  - REST/GraphQL
- 開発環境
  - WezTerm/Herdr/Neovim/AeroSpace/Vicinae
- AI Coding Agent
  - Claude Code/Codex

## 自己PR

「怠惰を求めて勤勉に行き着く」がモットーです。
Larry Wallの言う「プログラマの美徳としての怠惰」のように効率を求め、仕組み化や自動化には労を惜しみません。
具体的には、Neovimなどの開発ツールのカスタマイズや、作業を自動化するスクリプトの作成など、開発環境の改善を日常的に行っています。
最近は、Claude CodeやCodexを使用した開発フローを整えており、定型作業をSkillとして切り出すなどをして、日々の開発に取り入れています。

技術面での強みは、状態と座標計算が複雑に絡むリッチUIの実装です。
オンラインエディタの開発では、テーブルの複数セルのセレクションや行・列の削除、マージされたセルを考慮したリサイズ、インデントなどの機能を実装してきました。
個人開発でも、Google Calendarライクなカレンダーコンポーネント、Notionライクなドラッグ&ドロップで並び替え可能なツリー、矩形選択コンポーネントなどをライブラリとして公開しています。

仕事では、役割に応じて求められるアウトプットを考え、優先すべき部分を見極めて、質と速さを両立した開発・提案を心がけています。
チーム開発では、メンバーとの円滑な連携を大切にしています。
案件や環境が変わっても柔軟に適応し、チームとプロダクトに貢献します。

## この先やってみたいこと

フロントエンドからバックエンド、DB設計まで一貫して担当してきた経験に加えて、
今後はインフラ領域にも踏み込み、アーキテクチャ設計からデプロイ・運用まで、プロダクト開発に必要なすべての領域をカバーできるエンジニアになりたいです。
技術選定やスキーマ設計から関わり、設計の意思決定とチームの技術的な牽引を担うリードエンジニアを目指しています。
AI Coding Agentを前提とした開発プロセスの設計にも関心があり、チーム全体の生産性を上げる仕組みづくりに取り組みたいです。

## ポートフォリオ/記事

- [react-sandbox](https://github.com/kato-yoshiharu/react-sandbox)
  - [Google Calendarライクなコンポーネント](https://github.com/kato-yoshiharu/react-sandbox/tree/main/src/components/ui-components/WeeklyCalendar)
    - [デモ](https://kato-yoshiharu.github.io/react-sandbox/?path=/story/components-ui-components-weeklycalendar--default)
- Notionライクなアプリ(開発中)
  - [notion-clone](https://github.com/kato-yoshiharu/notion-clone)
    - [デモ](https://notion-clone-frontend.kato-yoshiharu.workers.dev)
  - [木構造をSQLで実装](https://zenn.dev/suimenkathemove/articles/sql-closure-table-for-tree)
  - [react-notion-sortable-tree](https://github.com/kato-yoshiharu/react-notion-sortable-tree)
    - [デモ](https://kato-yoshiharu.github.io/react-notion-sortable-tree)
  - [react-select-rectangle](https://github.com/kato-yoshiharu/react-select-rectangle)
    - [デモ](https://kato-yoshiharu.github.io/react-select-rectangle)

## 経歴

### チームラボエンジニアリング(正社員) 2019/04~2020/03

技術スタック: TypeScript/Vue.js/Nuxt.js
規模: バックエンド5名 / フロントエンド2名
担当工程: 実装 / テスト / 保守・運用

- [チームラボAIbot](https://www.team-lab.com/teamlabaibot/)のフロントエンドの開発
- [チームラボAIbot](https://www.team-lab.com/teamlabaibot/)の管理画面のフロントエンドの開発
- [チームラボチケットシステム](https://www.team-lab.com/ticket/)のフロントエンドの開発

### Stayway(正社員) 2020/03~2020/12

技術スタック: TypeScript/Next.js
規模: バックエンド2名 / フロントエンド1名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

- 旅行メディアサイト+旅行SNSアプリ[stayway media](https://stayway.jp/tourism)の開発
- 地域の食・体験のクラウドファンディングアプリ[stayway ticket](https://stayway.jp/projects)の開発

### MedUp(業務委託) 2021/01~2021/07

技術スタック: TypeScript/Next.js
規模: フルスタック3名 / フロントエンド1名
担当工程: 詳細設計 / 実装 / テスト

- 医療機関の営業支援・顧客管理ツール[foro CRM](https://www.foro-crm.jp/)の開発

### FRAIM(業務委託) 2021/07~2025/02

技術スタック: TypeScript/React.js/Next.js/Rust/Axum/GraphQL/DynamoDB/PostgreSQL

#### 契約書のオンラインエディタ[lawgue](https://lawgue.com/)の開発

規模: フルスタック10名ほど / インフラ1名 / ML2名
担当工程: 実装 / テスト / 保守・運用

フロントエンド領域で最も実装が難しいソフトウェアの1つであるエディタ。そのフロントエンドとバックエンドの機能追加と改修を担当。

- テーブルの、複数選択した行や列を削除する機能の実装
- コメントのメンションの抽出の作り直し
- 通知の既読機能の実装
- Popoverコンポーネントの座標の計算の作り直しと、枠からはみ出る場合の折り返しの実装
- テーブルの幅や高さのリサイズの線の、マージされたセルの考慮
- エディタのメニューをVSCodeのアクティビティバーのように縦にする
- ドキュメントの履歴の任意のバージョンのプレビューページの実装
- テーブルのインデントの実装
- 行末に半角スペースがある場合は行を折り返さないように修正
- テーブルの複数セルのセレクションの移動の実装

#### ドキュメント作成ツールの開発

規模: バックエンド1名 / フロントエンド1名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

DnDで木構造のスクリプトを作成し、そのスクリプトを実行することによってアンケートを作成し、そのアンケートを答えることによってドキュメントを作成する。
スクリプトの要素には、ドキュメントの読み込み、スクリプトの読み込み、変数の代入、分岐、反復、テキストの挿入、入力(テキスト)、入力(選択)がある。
フロントエンドの開発の立ち上げから担当。

### クロステックマネジメント(業務委託) 2024/09~2025/08

技術スタック: TypeScript/Next.js/Go/Echo/PostgreSQL
規模: フルスタック4名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

- オンボーディングタスク管理アプリのフロントエンドとバックエンドの開発
- 教材アプリのフロントエンドとバックエンドの開発
  - 動画教材のVideoPlayer機能の開発
  - 教材の同期APIのリファクタリングとパフォーマンス改善
    - 複数ファイルのアップロードを並行処理化

### 株式会社estie(業務委託) 2025/04~2026/05

技術スタック: TypeScript/Next.js/Rust/Actix Web/GraphQL/PostgreSQL
規模: フルスタック10名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト / 保守・運用

不動産の売買管理システムのバックエンド、フロントエンドの開発

- OCR機能のハイライトの座標取得の改善
- 住所の正規化のマイグレーションスクリプト(並列処理)の作成
- ダンプデータのエクスポートのスクリプトの作成
- フリーワード検索APIの実装
- 一覧ページのソート機能の実装
- ヒストグラム機能のバックエンドとフロントエンドの改修
- マッチング機能のAPIの実装

### 株式会社WEEL(業務委託) 2026/06~2026/08

技術スタック: TypeScript/Next.js/Tailwind CSS/shadcn + Radix UI/assistant-ui/Orval/Storybook
状態管理: TanStack Query/nuqs
テストツール: Vitest/Testing Library/Playwright
規模: バックエンド1名 / フロントエンド1名
担当工程: 基本設計 / 詳細設計 / 実装 / テスト

自社製品に関する問い合わせの回答をサポートするチャットボットの開発。
フロントエンドの開発を立ち上げから1人で担当。

- 開発基盤の構築
  - shadcn/uiをベースとしたデザインシステムの構築
  - feature-based アーキテクチャの採用
- 認証
  - Microsoft Entra ID(MSAL)によるSSO認証の実装
- API連携
  - OrvalでOpenAPI schemaから型とTanStack Queryのhooksを自動生成
- チャット機能
  - assistant-uiを使ったChatGPTのようなUIの実装
  - SSEによるストリーミング応答の表示
  - スレッドの一覧表示・リネーム・削除、回答へのフィードバック機能の実装
- 問い合わせ機能
  - 問い合わせ一覧の無限スクロール、製品での絞り込み、ソートの実装

#### 生成AIの活用

Claude Codeを開発プロセスに組み込み、人間は意思決定とレビューを担当し、AIは実装を担当する体制で開発を進めました。

- ハーネスエンジニアリング
  - メモリファイルにコンテキストを書き、AIがミスをするたびにルールを改善して同じミスを繰り返さない仕組みを整備
  - 定型作業をSkillとして切り出し、繰り返し実行できるように整備
  - Hooksで、LintやTestなどの機械的なチェックを自動実行させる
- ADR駆動開発
  - ADRを実装後の記録ではなく実装前の仕様書として書き、設計判断の背景をAIとチームの共通コンテキストにする
- サブエージェントによるレビュー
  - 実装したエージェント自身は自分のコードを高く評価するため、レビュー専用のサブエージェント(Devil's Advocate)を用意し、批判的にレビューさせる
- git worktreeによる並列開発
  - 作業ツリーを複数用意してAIを並列実行。ポート番号やコンテナ名が衝突しないよう、環境変数ひとつでローカル環境を分離できるSkillを整備
