# Health Check Script

## Description
System health monitoring script that saves information to a timestamped log file.

## Requirements
- Creates `healthcheck.sh` script
- Outputs system date, uptime, CPU load, memory usage, disk usage, top 5 processes, service status
- Logs to `healthlog.txt` with timestamp

## Usage
```bash
chmod +x healthcheck.sh
./healthcheck.sh
```

## Files
- `healthcheck.sh` - Main script
- `healthlog_YYYYMMDD_HHMMSS.txt` - Generated log file
- `README.md` - This file
