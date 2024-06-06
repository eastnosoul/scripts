git worktree add /tmp/branch branch
# 一些自定义的操作，如：
# npm run build
# mdbook build
rm -rf /tmp/branch/* # this won't delete the .git directory
cp -rp branch/* /tmp/branch/
cd /tmp/branch
git add -A
git commit -m 'new branch message'
git push origin branch
git worktree remove /tmp/branch
cd -
