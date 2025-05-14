@echo off
@REM %1 -> Current Directory
@REM %2 -> Repo name

cd /d %1/%2

rmdir /s /q build
mkdir build
cmake --preset default
cmake --build ./build