:: ref https://eorf.hatenablog.com/entry/2021/07/24/050800

:: GitHub or othre service settings
set GITHUB_ID=eorfeorf
set REPO_TYPE=public
set IGNORE=Unity
set LICENSE=MIT
set DESCRIPTION=""
set ISSUES=false
set WIKI=false

::@echo off
setlocal
popd %~dp0

:: Get folder name
set THIS_PATH=%1\
echo %THIS_PATH%
for %%1 in ("%THIS_PATH:~0,-1%") do set REPO_NAME=%%~nx1
echo %REPO_NAME%

:: Init local folder
pushd "./%REPO_NAME%"
git init -b main
popd


:: Make initial repo
gh repo create %REPO_NAME% --%REPO_TYPE% -g="%IGNORE%" --license="%LICENSE%" -d=%DESCRIPTION% --enable-issues=%ISSUES% --enable-wiki=%WIKI% -y

set REPO_URL=https://github.com/%GITHUB_ID%/%REPO_NAME%.git

pushd "./%REPO_NAME%"

git remote add origin %REPO_URL%
git pull origin main


:: Set ignore file for Rider
echo # Rider>>.gitignore
echo .idea/>>.gitignore


git add .
git commit -m "Initial commit"
git push -u origin HEAD:main