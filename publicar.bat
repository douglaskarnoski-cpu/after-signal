@echo off
setlocal
title AFTER SIGNAL - publicar
cd /d "%~dp0"
echo.
echo   AFTER SIGNAL - enviando para o GitHub
echo   =====================================
echo   repositorio: https://github.com/douglaskarnoski-cpu/after-signal
echo.
where git >nul 2>nul || (echo Git nao encontrado: https://git-scm.com/download/win & pause & exit /b)

if not exist .git git init -b main
git add -A
git -c user.name="Douglas Karnoski" -c user.email="douglaskarnoski@gmail.com" commit -m "AFTER SIGNAL" 2>nul
git remote remove origin 2>nul
git remote add origin https://github.com/douglaskarnoski-cpu/after-signal.git
git branch -M main

echo   Enviando... (o Git pode pedir para voce entrar na conta do GitHub)
git push -u origin main --force
if errorlevel 1 (
  echo.
  echo   O envio falhou. Normalmente e login: rode "git config --global credential.helper manager"
  echo   ou instale o GitHub CLI e rode "gh auth login".
  pause & exit /b
)

echo.
echo   Pronto. Em 1-2 minutos o site estara em:
echo      https://douglaskarnoski-cpu.github.io/after-signal/
echo.
start "" https://douglaskarnoski-cpu.github.io/after-signal/
pause
