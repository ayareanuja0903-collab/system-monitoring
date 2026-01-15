🖥️ System Monitor with AI Alerting (system_monitor.sh)
📌 Project Overview
This project provides a Bash-based system monitoring and alerting solution for Linux/Ubuntu servers.The script continuously monitors CPU, Memory, and Disk usage, makes AI-style decisions using thresholds, and sends email alerts in a professional HTML table format when issues are detected.
This project is ideal for: - DevOps & Linux practice - Server health monitoring - Learning cron automation - Resume / GitHub projects

📂 Project Structure
.├── system_monitor.sh      # Monitoring & alerting script├── README.md              # Project documentation└── system_monitor.log     # Generated log file

⚙️ Features
	•	✅ CPU usage monitoring
	•	✅ Memory usage monitoring
	•	✅ Disk usage monitoring
	•	✅ Threshold-based alerting (AI-style logic)
	•	✅ HTML email alerts (table format)
	•	✅ Timestamped log entries
	•	✅ Cron-job friendly
	•	✅ Lightweight & production-ready

🛠️ Prerequisites
	•	Ubuntu / Linux OS
	•	Bash shell (/bin/bash)
	•	mailutils package (for email alerts)
Install mail utility
sudo apt updatesudo apt install mailutils -y

🚀 Installation & Setup
1️⃣ Clone or Create Files
touch system_monitor.shchmod +x system_monitor.sh
2️⃣ Add Script Code
Paste the provided system_monitor.sh code into the file.
3️⃣ Configure Email
Edit these variables inside the script:
EMAIL_TO="admin@example.com"CPU_THRESHOLD=80MEM_THRESHOLD=80DISK_THRESHOLD=85

▶️ Run the Script Manually
./system_monitor.sh

📄 Log File Details
Log file location:
/tmp/system_monitor.log
Sample Log Output
------------------------Date: Thu Jan 15 20:10:12 IST 2026CPU Usage: 85%Memory Usage: 70%Disk Usage: 90%System Status: ATTENTION REQUIRED------------------------

📧 Email Alert (HTML Table Format)
Email Subject
🚨 ALERT: System Health Issue on ubuntu-server
Email Body (Rendered as Table)
Metric
Current Usage
Threshold
CPU Usage
85%
80%
Memory Usage
70%
80%
Disk Usage
90%
85%
Host: ubuntu-serverStatus: 🔴 ATTENTION REQUIRED

🤖 AI-Style Alerting Logic
The script behaves like a simple AI decision engine:
	•	Collects multiple system metrics
	•	Compares values against thresholds
	•	Automatically decides system health
	•	Sends alerts only when required
Decision Rule
If ANY metric > threshold → ALERTElse → HEALTHY

⏱️ Automate Using Cron
Edit crontab:
crontab -e
Run every 5 minutes
*/5 * * * * /home/username/system_monitor.sh
📌 Use absolute paths when running via cron.

🐞 Common Issues & Fixes
❌ Email not received
✔ Ensure mailutils is installed✔ Check spam folder✔ Verify mail server configuration
❌ Script runs manually but not in cron
✔ Use full paths inside script✔ Redirect output if needed
❌ Permission denied
chmod +x system_monitor.sh

🔐 Security & Permissions
	•	Avoid storing sensitive emails in public repos
	•	Use /tmp or /var/log carefully
	•	For system-wide monitoring, use sudo crontab -e

📚 Learning Outcomes
	•	Bash scripting fundamentals
	•	Linux system monitoring
	•	Email alert automation
	•	Cron job scheduling
	•	Real-world DevOps monitoring concepts

🚀 Future Enhancements
	•	📈 Auto-learning thresholds
	•	📊 Trend & historical analysis
	•	🔔 Slack / Telegram alerts
	•	🐳 Docker & Kubernetes monitoring
	•	📦 Prometheus / Grafana integration

👤 Author
Anuja AyareDevOps | Linux | Automation

📜 License
Open-source — free to use for learning, practice, and demonstration purposes.

✅ This project demonstrates real-world monitoring and alerting used in DevOps environments.