@echo off
REM ============================================
REM Step2Campus - START Both Servers
REM ============================================
REM This script installs dependencies (if needed)
REM and starts both Client + Server dev servers.
REM ============================================

echo.
echo  =============================================
echo   Step2Campus - Local Environment Startup
echo  =============================================
echo.

REM --- Install Client Dependencies ---
echo [1/4] Installing Client dependencies...
cd /d "%~dp0Client"
call npm install --silent
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Client npm install failed!
    pause
    exit /b 1
)
echo [OK] Client dependencies installed.
echo.

REM --- Install Server Dependencies ---
echo [2/4] Installing Server dependencies...
cd /d "%~dp0Server"
call npm install --silent
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Server npm install failed!
    pause
    exit /b 1
)
echo [OK] Server dependencies installed.
echo.

REM --- Check .env file ---
echo [3/4] Checking Server .env file...
if not exist "%~dp0Server\.env" (
    echo [WARNING] No .env file found in Server!
    echo          Copy .env.example to .env and fill in your values.
    echo          The server will NOT start without it.
    pause
    exit /b 1
)
echo [OK] .env file found.
echo.

REM --- Start Both Servers ---
echo [4/4] Starting servers...
echo.
echo  CLIENT: http://localhost:5173  (Vite React)
echo  SERVER: http://localhost:5000  (Express API)
echo.
echo  Press Ctrl+C in each window to stop.
echo  Or run stop.bat to kill all Node processes.
echo =============================================
echo.

REM Start Server in a new window
start "Step2Campus-Server" cmd /k "cd /d "%~dp0Server" && npm run dev"

REM Start Client in a new window
start "Step2Campus-Client" cmd /k "cd /d "%~dp0Client" && npm run dev"

echo [DONE] Both servers launched in separate windows.
echo.
pause
