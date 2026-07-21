#!/usr/bin/env bash
#
# ローカルにある「他 organization のリポジトリ」を、自分のプライベートリポジトリとして管理するためのスクリプト。
#
# 仕組み:
#   - 元のリモート(他 org)を `upstream` として残す ... fetch 専用。push はしない
#   - 自分のプライベートリポジトリを `origin` に付け替える ... ここに push する
#
# これにより「upstream から取り込む → origin へ push」= 自分のリポジトリに反映、が安全に行える。
# 元リポジトリへは決して push されない。
#
# 使い方:
#   1) 初回セットアップ (リモートの付け替え & 初回 push)
#        ./scripts/mirror-to-own.sh init --repo <ローカルリポジトリのパス>

set -euo pipefail

# 自分の GitHub アカウントのベース URL
readonly OWN_GITHUB_BASE="https://github.com/kato-yoshiharu"

# ---- 共通ユーティリティ ---------------------------------------------------

err()  { printf '\033[31mError:\033[0m %s\n' "$*" >&2; }
info() { printf '\033[36m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[33mWarn:\033[0m %s\n' "$*" >&2; }

require_git_repo() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    err "git リポジトリの中で実行してください。"
    exit 1
  fi
}

remote_exists() {
  git remote | grep -qx "$1"
}

current_branch() {
  git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD
}

# ---- init: リモートの付け替え & 初回 push ---------------------------------

cmd_init() {
