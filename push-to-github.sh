#!/usr/bin/env bash
# 将当前文件夹的新网站内容强制推送到 GitHub，替换旧的 pages-hugo 分支。
# 用法：在本文件夹里右键 "Git Bash Here"，然后运行：  bash push-to-github.sh
set -e

REPO_URL="https://github.com/REZuLt-525/REZuLt-525.github.io.git"
BRANCH="pages-hugo"

# 切换到脚本所在目录
cd "$(dirname "$0")"

echo ">> 初始化仓库..."
rm -rf .git
git init -q
git checkout -q -B "$BRANCH"

# 提交身份（仅本仓库生效）
git config user.name "REZuLt-525"
git config user.email "lizao50323@gmail.com"

echo ">> 配置远程..."
git remote add origin "$REPO_URL"

echo ">> 添加并提交全部文件..."
git add -A
git commit -q -m "Replace site with new content"

echo ">> 强制推送到 $BRANCH（会替换旧内容）..."
git push -f origin "$BRANCH"

echo ""
echo ">> 完成！几分钟后访问 https://rezult-525.github.io 查看新网站。"
