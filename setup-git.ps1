# 一键初始化 git 仓库（Yuike 喵写的）
# 用法：在 PowerShell 里执行
#   powershell -ExecutionPolicy Bypass -File "D:\git库\setup-git.ps1"

$ErrorActionPreference = 'Stop'
Set-Location 'D:\git库'

Write-Host "`n==== 1/7 检查 git ====" -ForegroundColor Cyan
git --version

Write-Host "`n==== 2/7 初始化仓库 ====" -ForegroundColor Cyan
if (Test-Path '.git') {
    Write-Host '已经是 git 仓库，跳过 init' -ForegroundColor Yellow
} else {
    git init
}

Write-Host "`n==== 3/7 分支改为 main ====" -ForegroundColor Cyan
git branch -M main

Write-Host "`n==== 4/7 检查身份配置 ====" -ForegroundColor Cyan
$name  = git config user.name
$email = git config user.email
if (-not $name)  { git config --global user.name 'Yuike';              Write-Host '已设置 user.name = Yuike（可改）' -ForegroundColor Yellow }
if (-not $email) { git config --global user.email 'yuike@example.com'; Write-Host '已设置 user.email = yuike@example.com（可改）' -ForegroundColor Yellow }
Write-Host "user.name  = $(git config user.name)"
Write-Host "user.email = $(git config user.email)"

Write-Host "`n==== 5/7 暂存 ====" -ForegroundColor Cyan
git add -A
git status --short

Write-Host "`n==== 6/7 提交 ====" -ForegroundColor Cyan
git commit -m 'init: 第一个提交喵'

Write-Host "`n==== 7/7 状态 ====" -ForegroundColor Cyan
git log --oneline -5
git remote -v

Write-Host @"

------------------------------------------------------------
本地仓库已经建好了喵～接下来推送到 GitHub：

  1) 先在 GitHub 网页上新建一个**空的**仓库，名字写 git库
     （不要勾 Add a README / .gitignore / license）

  2) 回到这里执行（把 你的用户名 换成真的）：

     cd D:\git库
     git remote add origin https://github.com/你的用户名/git库.git
     git push -u origin main

------------------------------------------------------------
"@ -ForegroundColor Green

Read-Host '按回车关闭'
