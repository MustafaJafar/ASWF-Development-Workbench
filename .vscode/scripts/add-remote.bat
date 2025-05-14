@echo off
@REM %1 -> Current Directory
@REM %2 -> Remote name
@REM %3 -> Repo name


cd /d %1/%3
git remote add %2 https://github.com/%2/%3.git
echo Remote '%2' has been added.