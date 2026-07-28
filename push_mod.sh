#!/data/data/com.termux/files/usr/bin/bash
# Create-Aeronautics 源码一键上传Github脚本

# ========== 配置区 按需修改 ==========
SOURCE_DIR="$HOME/Create-Aeronautics-1.18"
REMOTE_URL="https://github.com/HaQiMi-Din/Create-Aeronautics-Fabric.git"
BRANCH="main"
COMMIT_MSG="Upload Create Aeronautics 1.18 source code"
# ====================================

echo "【1】进入源码目录：$SOURCE_DIR"
cd "$SOURCE_DIR" || { echo "目录不存在！检查路径"; exit 1; }

echo "【2】初始化Git仓库"
git init

echo "【3】添加全部文件（自动忽略.gitignore内容）"
git add .

echo "【4】本地提交"
git commit -m "$COMMIT_MSG"

echo "【5】绑定远程仓库"
git remote remove origin 2>/dev/null
git remote add origin $REMOTE_URL

echo "【6】切换分支 $BRANCH"
git branch -M $BRANCH

echo "【7】尝试拉取远端合并（解决README冲突）"
git pull origin $BRANCH --allow-unrelated-histories 2>/dev/null

echo "【8】推送代码到Github"
git push -u origin $BRANCH

echo "✅ 推送执行完毕！"

