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

# ---- init: リモートの付け替え & 初回 push ---------------------------------

cmd_init() {
  if [[ "${1:-}" != "--repo" || -z "${2:-}" ]]; then
    err "--repo <ローカルリポジトリのパス> を指定してください。"
    exit 1
  fi
  local repo_dir="$2"

  if [[ ! -d "$repo_dir" ]]; then
    err "指定されたパスが存在しません: $repo_dir"
    exit 1
  fi
  cd "$repo_dir"

  require_git_repo

  local repo_name own_url
  repo_name=$(basename "$(pwd)")
  own_url="${OWN_GITHUB_BASE}/${repo_name}.git"

  # 現在の origin(=他 org) を upstream として退避
  if remote_exists origin; then
    local origin_url
    origin_url=$(git remote get-url origin)
    if remote_exists upstream; then
      info "upstream は既に存在します: $(git remote get-url upstream)"
    else
      info "現在の origin ($origin_url) を upstream として退避します。"
      git remote rename origin upstream
    fi
  else
    warn "origin が存在しません。upstream の退避はスキップします。"
  fi

  # origin を自分のリポジトリに設定
  if remote_exists origin; then
    info "origin を上書きします -> $own_url"
    git remote set-url origin "$own_url"
  else
    info "origin を追加します -> $own_url"
    git remote add origin "$own_url"
  fi

  # 全ブランチ・タグを自分のリポジトリへ push
  info "全ブランチ・タグを origin へ push します..."
  git push origin --all
  git push origin --tags

  # 全ローカルブランチの upstream(追跡先)を origin に向ける
  local br
  git for-each-ref --format='%(refname:short)' refs/heads | while read -r br; do
    git branch --set-upstream-to="origin/${br}" "$br" >/dev/null 2>&1 || true
  done

  info "完了。現在のリモート構成:"
  git remote -v
}

# ---- エントリポイント -----------------------------------------------------

main() {
  local sub="${1:-}"
  shift || true
  case "$sub" in
    init) cmd_init "$@" ;;
    *) err "不明なサブコマンド: ${sub:-（なし）}"; exit 1 ;;
  esac
}

main "$@"
