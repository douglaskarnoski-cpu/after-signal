@echo off
title AFTER SIGNAL
cd /d "%~dp0"
echo   AFTER SIGNAL - sintonizando...
where python >nul 2>nul
if %errorlevel%==0 (
  start "" http://localhost:8777
  python -m http.server 8777
) else (
  echo Python nao encontrado - abrindo direto no navegador.
  echo Sem servidor local, a rede de relays e a localizacao podem nao funcionar.
  start "" "%~dp0index.html"
  pause
)
