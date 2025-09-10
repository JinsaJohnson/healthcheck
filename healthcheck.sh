#!/bin/bash

# Basic Health Check Script
# Log file with timestamp
LOG_FILE="healthlog_$(date +%Y%m%d_%H%M%S).txt"

# Group all commands and redirect to log file, while also showing on screen
{
    echo "Health Check Report - $(date)"
    echo "================================="
    
    # System date and time
    echo "System Date and Time:"
    date
    echo ""
    
    # Uptime
    echo "Uptime:"
    uptime
    echo ""
    
    # CPU load from uptime
    echo "CPU Load:"
    uptime | awk -F'load average:' '{print "Load Average:" $2}'
    echo ""
    
    # Memory usage
    echo "Memory Usage:"
    free -h
    echo ""
    
    # Disk usage
    echo "Disk Usage:"
    df -h
    echo ""
    
    # Top 5 memory-consuming processes
    echo "Top 5 Memory-Consuming Processes:"
    ps aux --sort=-%mem | head -6
    echo ""
    
    # Check services
    echo "Service Status:"
    if pgrep nginx > /dev/null; then
        echo "nginx: running"
    else
        echo "nginx: not running"
    fi
    
    if pgrep ssh > /dev/null || pgrep sshd > /dev/null; then
        echo "ssh: running"
    else
        echo "ssh: not running"
    fi
    
    echo ""
    echo "Health check completed. Log saved to: $LOG_FILE"
    
} > "$LOG_FILE"

# Also display on screen
cat "$LOG_FILE"
