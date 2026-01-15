#!/bin/bash

# ===============================
# Configuration
# ===============================
LOG_FILE="/tmp/system_monitor.log"
EMAIL_TO="admin@example.com"     # change this
HOSTNAME=$(hostname)

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=85

DATE=$(date)

# ===============================
# Collect Metrics
# ===============================
CPU_USAGE=$(top -bn1 | awk '/Cpu/ {print int(100 - $8)}')
MEM_USAGE=$(free | awk '/Mem/ {print int($3/$2 * 100)}')
DISK_USAGE=$(df / | awk 'NR==2 {print int($5)}')

STATUS="HEALTHY"
ALERT="NO"

if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ] || \
   [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ] || \
   [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    STATUS="ATTENTION REQUIRED"
    ALERT="YES"
fi

# ===============================
# Log Output
# ===============================
{
echo "------------------------"
echo "Date: $DATE"
echo "CPU Usage: $CPU_USAGE%"
echo "Memory Usage: $MEM_USAGE%"
echo "Disk Usage: $DISK_USAGE%"
echo "System Status: $STATUS"
echo "------------------------"
echo ""
} >> "$LOG_FILE"

# ===============================
# Email Alert (HTML Table)
# ===============================
if [ "$ALERT" = "YES" ]; then

EMAIL_BODY=$(cat <<EOF
<html>
<body>
<h2 style="color:red;">System Alert Report</h2>

<table border="1" cellpadding="8" cellspacing="0" style="border-collapse:collapse;">
<tr style="background-color:#f2f2f2;">
<th>Metric</th>
<th>Current Usage</th>
<th>Threshold</th>
</tr>

<tr>
<td>CPU Usage</td>
<td>${CPU_USAGE}%</td>
<td>${CPU_THRESHOLD}%</td>
</tr>

<tr>
<td>Memory Usage</td>
<td>${MEM_USAGE}%</td>
<td>${MEM_THRESHOLD}%</td>
</tr>

<tr>
<td>Disk Usage</td>
<td>${DISK_USAGE}%</td>
<td>${DISK_THRESHOLD}%</td>
</tr>

</table>

<br>
<b>Host:</b> $HOSTNAME <br>
<b>Date:</b> $DATE <br>
<b>Status:</b> <span style="color:red;">$STATUS</span>

</body>
</html>
EOF
)

echo "$EMAIL_BODY" | mail -a "Content-Type: text/html" \
-s "🚨 ALERT: System Health Issue on $HOSTNAME" "$EMAIL_TO"

fi