@echo off
chcp 65001 >nul
cd /d "D:\git库"

echo.
echo ==== 1/6 检查 git ====
where git || (echo [错误] 没找到 git，请先安装 Git for Windows & pause & exit /b 1)
git --version

echo.
echo ==== 2/6 初始化仓库 ====
if exist ".git" (echo 已经是 git 仓库, 跳过 init) else (git init)

echo.
echo ==== 3/6 分支名改成 main ====
git branch -M main

echo.
echo ==== 4/6 检查身份配置 ====
git config user.name
if errorlevel 1 git config --global user.name "Yuike"
git config user.email
if errorlevel 1 git config --global user.email "yuike@example.com"
echo 当前 user.name  :
git config user.name
echo 当前 user.email :
git config user.email

echo.
echo ==== 5/6 暂存并提交 ====
git add -A
git status --short
git commit -m "init: 第一个提交喵"

echo.
echo ==== 6/6 仓库状态 ====
git log --oneline -5
git remote -v

echo.
echo ------------------------------------------------------------
echo  下一步推到 GitHub:
echo    1) 网页上新建一个空的仓库, 名字写 gitku
echo       (不要勾 Add a README / .gitignore / license)
echo    2) 回到这里执行:
echo       cd /d D:\git库
echo       git remote add origin https://github.com/你的用户名/gitku.git
echo       git push -u origin main
echo ------------------------------------------------------------
echo.
pause
