# Redis Server untuk Veritas Project

Redis server untuk message broker sinkronisasi real-time antara ServerDaerah dan ServerPusat.

## Quick Start

### Windows
```powershell
.\start-redis.bat
```

### Manual Start
```powershell
.\redis-server.exe redis.conf
```

## Configuration

Edit `redis.conf` untuk custom configuration:
- Port: 6379 (default)
- Max Memory: 256mb
- Password: (kosongkan untuk development)

## Commands

**Start Redis:**
```powershell
.\start-redis.bat
```

**Stop Redis:**
```powershell
Ctrl+C di terminal Redis
```

**Check Status:**
```powershell
redis-cli ping
# Expected: PONG
```

## Monitoring

**Check Pub/Sub Channels:**
```powershell
redis-cli PUBSUB CHANNELS
```

**Monitor All Commands:**
```powershell
redis-cli MONITOR
```

**View Active Connections:**
```powershell
redis-cli CLIENT LIST
```

## Troubleshooting

**Port Already in Use:**
```powershell
# Check process using port 6379
netstat -ano | findstr :6379

# Kill process
taskkill /PID <PID> /F
```

**Redis Not Responding:**
```powershell
# Restart Redis
.\start-redis.bat
```

## Notes

- Redis data disimpan di memory (development mode)
- Untuk production, enable persistence di redis.conf
- Log file: redis.log
