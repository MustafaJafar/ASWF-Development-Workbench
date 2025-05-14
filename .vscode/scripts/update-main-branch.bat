@echo off
@REM %1 -> Repo Directory
@REM %2 -> Branch name


cd /d %1/%2
git checkout main
git pull origin main