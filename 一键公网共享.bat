@echo off
chcp 65001 >nul
title 增肌减脂计算器 - 公网共享
echo ================================================
echo   增肌减脂计算器 - 公网共享启动器
echo ================================================
echo.
cd /d "%~dp0"

rem 启动本地服务器（找得到 python 就用，否则用绝对路径）
where python >nul 2>nul
if %errorlevel%==0 (
  start "本地服务器8765" /min python -m http.server 8765 --bind 127.0.0.1
) else (
  start "本地服务器8765" /min D:\Python312\python.exe -m http.server 8765 --bind 127.0.0.1
)

echo 本地服务器已启动（端口 8765）。
echo 正在建立 Cloudflare 免费公网隧道，约 10 秒后在下方日志出现网址：
echo    https://xxxx-yyyy-yyyy.trycloudflare.com
echo 用该网址 + /index.html 即可在任何设备访问。关闭本窗口即停止共享。
echo.
"%USERPROFILE%\.cloudflared\cloudflared.exe" tunnel --url http://127.0.0.1:8765 --no-autoupdate
pause
