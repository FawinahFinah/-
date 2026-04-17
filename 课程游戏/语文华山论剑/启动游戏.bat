@echo off
REM 华山论剑 - 本地服务器快速启动

title 华山论剑游戏服务器

cd /d "%~dp0"

echo.
echo ╔═════════════════════════════════════════╗
echo ║     华山论剑 - 本地服务器启动          ║
echo ╚═════════════════════════════════════════╝
echo.

echo 正在启动服务器...
echo.

REM 尝试使用 Python
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [✓] 已检测到 Python
    echo.
    echo 📌 游戏地址: http://localhost:8000/华山论剑.html
    echo 📌 按 CTRL+C 可停止服务器
    echo.
    timeout /t 2
    start http://localhost:8000/华山论剑.html
    python -m http.server 8000
    goto :end
)

REM 如果没有 Python，尝试 Node.js
where node >nul 2>nul
if %errorlevel% equ 0 (
    echo [✓] 已检测到 Node.js
    echo.
    echo 📌 游戏地址: http://localhost:8000/华山论剑.html
    echo.
    timeout /t 2
    start http://localhost:8000/华山论剑.html
    npx http-server . -p 8000
    goto :end
)

REM 都没有安装
echo [✗] 未检测到 Python 或 Node.js
echo.
echo 请安装以下任意一个:
echo • Python: https://www.python.org/downloads/
echo • Node.js: https://nodejs.org/
echo.
echo 安装后重新运行此脚本
echo.
pause

:end
pause
