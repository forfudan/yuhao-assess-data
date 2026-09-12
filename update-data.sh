#!/bin/bash
# 更新數據文件腳本
# 使用覆蓋式提交，不保留歷史

set -e

DATA_REPO="/Users/ZHU/Programs/yuhao-ime/yuhao-assess-data"

echo "📦 更新 yuhao-assess-data 數據文件..."

cd "$DATA_REPO"

# 檢查是否有更改
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ 沒有數據更改，無需提交"
    exit 0
fi

# 顯示更改
echo "📝 以下文件已更改："
git status --short

# 覆蓋式提交
git add .
git commit --amend -m "Latest data snapshot $(date +%Y-%m-%d)"

echo "🚀 強制推送到 GitHub..."
git push -f origin main

echo "✅ 完成！數據已更新"
echo "⏳ GitHub Pages 將在 1-2 分鐘內自動更新"
