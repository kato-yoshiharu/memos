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
