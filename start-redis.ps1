# PowerShell Script to Start Redis Server
Write-Host "================================================" -ForegroundColor Cyan
Write-Host " Redis Server for Veritas Project" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$redisExe = "redis-server.exe"
$redisZip = "redis.zip"
$redisUrl = "https://github.com/tporadowski/redis/releases/download/v5.0.14.1/Redis-x64-5.0.14.1.zip"

# Check if Redis is already downloaded
if (-not (Test-Path $redisExe)) {
    Write-Host "Redis not found. Downloading..." -ForegroundColor Yellow
    Write-Host ""
    
    try {
        Write-Host "Downloading Redis for Windows..." -ForegroundColor Green
        Invoke-WebRequest -Uri $redisUrl -OutFile $redisZip
        
        Write-Host "Extracting Redis..." -ForegroundColor Green
        Expand-Archive -Path $redisZip -DestinationPath . -Force
        
        Write-Host "Cleaning up..." -ForegroundColor Green
        Remove-Item $redisZip
        
        Write-Host ""
        Write-Host "Redis downloaded successfully!" -ForegroundColor Green
        Write-Host ""
    }
    catch {
        Write-Host "ERROR: Failed to download Redis" -ForegroundColor Red
        Write-Host "Please download manually from: $redisUrl" -ForegroundColor Yellow
        Write-Host "Extract and place redis-server.exe in this folder" -ForegroundColor Yellow
        Write-Host ""
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host "Starting Redis Server..." -ForegroundColor Green
Write-Host ""
Write-Host "Redis is running on localhost:6379" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

# Start Redis with config
& ".\$redisExe" redis.conf
