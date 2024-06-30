#!/bin/bash

# 确保脚本在遇到错误时退出
set -e

# 定义变量
Path=""
Branch=""

# 检查变量是否为空
if [[ -z "$Path" || -z "$Branch" ]]; then
  echo "Error: Path and Branch must be specified."
  exit 1
fi


# 添加工作树
git worktree add $Path $Branch

# 清空目标目录（保留 .git 目录）
rm -rf $Path/*

# 执行自定义操作
# npm run build
# mdbook build

# 复制文件到临时目录
cp -rp $Path/* /tmp/$Branch/

# 切换到临时目录
cd /tmp/$Branch

# 提交并推送更改
git add -A
git commit -m 'new branch message'
git push origin $Branch

# 移除工作树
git worktree remove $Path

# 返回之前的目录
cd -

# 清理临时目录（可选）
rm -rf /tmp/$Branch

echo "Script executed successfully."

