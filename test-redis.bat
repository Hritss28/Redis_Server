@echo off
echo Testing Redis connection...
echo.

redis-cli ping

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Redis is running properly!
    echo.
    echo Testing Pub/Sub channels...
    redis-cli PUBSUB CHANNELS
    echo.
    echo Active clients:
    redis-cli CLIENT LIST
) else (
    echo.
    echo Redis is not running!
    echo Please start Redis first using start-redis.bat
)

echo.
pause
