@echo off
REM ============================================
REM Step2Campus - STOP All Servers
REM ============================================
REM Kills all Node.js processes running the
REM Client (Vite) and Server (Express) servers.
REM ============================================

echo.
echo  =============================================
echo   Step2Campus - Stopping All Servers
echo  =============================================
echo.

REM Kill all node processes
taskkill /F /IM node.exe >nul 2>&1

if %ERRORLEVEL% equ 0 (
    echo [OK] All Node.js processes stopped.
) else (
    echo [INFO] No running Node.js processes found.
)

echo.
echo  Servers are now stopped.
echo  Run start.bat to restart.
echo =============================================
echo.
pause
