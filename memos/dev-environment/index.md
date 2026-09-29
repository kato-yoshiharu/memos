# Dev Environment

開発環境で使っているツールのメモ。

## ターミナル

WezTerm

## ターミナルマルチプレクサ

herdr

## エディタ

Neovim

## ランチャー

Vicinae

## ウィンドウマネージャ

- AeroSpace
  - タイリングウィンドウマネージャ
  - i3やyabaiと同じジャンルで、画面を自動分割してウィンドウを敷き詰める
- Magnet

## 自動化

- Hammerspoon
  - Luaで書く汎用自動化フレームワーク
  - ランチャー（Vicinae）やウィンドウマネージャ（AeroSpace）が持たない機能を、スクリプトで自作して補う位置づけ

## ファイラ

- yazi

## CLI ツール

- zoxide
- fzf
- fd
- mise

## シェルのディレクトリ移動

`cd` は 3 つのツールで組み立てている。

- zoxide : 履歴ベースでジャンプ先を決める
- fzf : ディレクトリ・パス・コマンド履歴を、あいまい検索する
- fd : カレント以下のディレクトリを列挙する

### zoxide のコマンド

- `z <dir_keyword>` : 履歴中で `<dir_keyword>` に一致する最上位候補へジャンプする
- `zi <dir_keyword>` : `<dir_keyword>` に一致する候補が複数あるとき fzf で選ぶ

### fzf のキーバインド

- `Ctrl+T` : ファイル・ディレクトリを検索し、パスをコマンドラインに挿入する
- `Ctrl+R` : コマンド履歴を検索する
- `Alt+C` : 配下のディレクトリを検索して `cd` する
  - `z` が履歴ベースなのに対し、`Alt+C` は未訪問のディレクトリも拾える。

引数に `**` と書いて `Tab` を押しても fzf が起動する。

## ブラウザ

Dia

## キーボード操作

- Homerow（クリックをキーボード操作に置き換えるツール）

## TODO

- NeoVim
  - Cursorから完全移行。設定、拡張機能、便利な機能
- Nix
- Octo.nvim
- gh dash
