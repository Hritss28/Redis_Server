@echo off
echo ================================================
echo  Redis Server for Veritas Project
echo ================================================
echo.

REM Check if Redis is already downloaded
if not exist "redis-server.exe" (
    echo Redis not found. Downloading...
    echo.
    
    REM Check if curl exists
    where curl >nul 2>nul
    if %ERRORLEVEL% EQU 0 (
        echo Downloading Redis for Windows...
        curl -L -o redis.zip https://github.com/tporadowski/redis/releases/download/v5.0.14.1/Redis-x64-5.0.14.1.zip
        
        echo Extracting Redis...
        tar -xf redis.zip
        
        echo Cleaning up...
        del redis.zip
        
        echo.
        echo Redis downloaded successfully!
        echo.
    ) else (
        echo ERROR: curl not found. Please download Redis manually from:
        echo https://github.com/tporadowski/redis/releases/download/v5.0.14.1/Redis-x64-5.0.14.1.zip
        echo.
        echo Extract the zip and place redis-server.exe in this folder.
        pause
        exit /b 1
    )
)

echo Starting Redis Server...
echo.
echo Redis is running on localhost:6379
echo Press Ctrl+C to stop
echo.

REM Start Redis with config
redis-server.exe redis.conf
