System Monitor Script (system_monitor.sh)
📌 Overview
system_monitor.sh is a simple Bash-based system monitoring script designed for Linux/Ubuntu servers. It collects key system health metrics such as CPU usage, memory usage, disk usage, and system uptime, and logs them into a file for auditing and troubleshooting.
This script is suitable for: - DevOps practice - Linux administration learning - Basic production monitoring via cron jobs

📂 Files
system_monitor.sh   # Monitoring shell scriptsystem_monitor.log  # Generated log file

⚙️ Features
	•	✅ CPU usage monitoring
	•	✅ Memory usage monitoring
	•	✅ Disk usage monitoring
	•	✅ System uptime tracking
	•	✅ Timestamped logs
	•	✅ Lightweight & cron-friendly

🛠️ Prerequisites
	•	Ubuntu / Linux system
	•	Bash shell (/bin/bash)
	•	Basic Linux utilities (df, free, uptime, top)

🚀 Installation & Setup
1️⃣ Create the Script
nano system_monitor.sh
Paste the script content and save.
2️⃣ Make it Executable
chmod +x system_monitor.sh
3️⃣ Run Manually
./system_monitor.sh
Logs will be written to:
/var/log/system_monitor.log
(or a custom path if configured in the script)

⏱️ Run Automatically Using Cron
Edit crontab:
crontab -e
Example: Run every 5 minutes
*/5 * * * * /home/username/system_monitor.sh
📌 Ensure absolute paths are used inside the script when running via cron.

📄 Sample Log Output
------------------------Date: Fri Jan  3 12:30:01 IST 2026Uptime: up 3 hours, 12 minutesCPU Usage: 18%Memory Usage: 45%Disk Usage: 62%------------------------

🐞 Common Issues & Fixes
❌ Error: unary operator expected
✔ Cause: Empty or uninitialized variables ✔ Fix: Always validate variables before numeric comparison
❌ Permission denied
✔ Fix:
chmod +x system_monitor.sh
❌ Script works manually but not in cron
✔ Use full paths for commands and log files

🔐 Permissions Note
If logging to /var/log/, run via root or sudo:
sudo crontab -e

👤 Author
Anuja AyareDevOps / Linux Practice Project
