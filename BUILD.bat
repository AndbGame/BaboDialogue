@echo off
cd /D "%~dp0"
echo **Compiling BaboDialogue sources (scripts\Source -^> scripts)
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Build.ps1"
echo **Exit code: %errorlevel%
pause
