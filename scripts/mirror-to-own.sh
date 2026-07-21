#!/usr/bin/env bash
#
# ローカルにある「他 organization のリポジトリ」を、自分のプライベートリポジトリとして管理するためのスクリプト。
#
# 仕組み:
#   - 元のリモート(他 org)を `upstream` として残す ... fetch 専用。push はしない
