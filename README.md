# linux-log-archiver
![Linux Distribution](https://img.shields.io/badge/Linux-Ubuntu-%23E95420?logo=ubuntu)
![GNU Bash Version](https://img.shields.io/badge/Bash-4%2B-%234EAA25?logo=gnubash&logoColor=white)
[![License](https://img.shields.io/badge/license-MIT-orange)](LICENSE)
![Made By](https://img.shields.io/badge/Made%20By-Reginald%20Griffin%20II-%23E85C33)

Finds all log files older than 7 days in /var/log, compresses them into a timestamped archive, and moves the archive to a backup folder. Deletes archives older than 30 days.
**_While in production, the `logrotate` command would be a more efficient choice. This script shows an understanding of the data retention process._**

## 🛠️ Prerequisites

- **Linux environment** (Ubuntu 20.04+, Debian 11+, or any distribution with Bash 4+)
- **Bash** (version 4+)
- **Basic Linux utilities**: `mkdir`, `find`, `mv`, `gzip`, `echo`

## 📦 Installation

1. Clone the repository:

```bash
git clone https://github.com/ReggieRay210/linux-log-archiver.git
cd linux-log-archiver
```
2. Make scripts executable:
```bash
chmod +x *.sh
```

## 📖 Usage 
Because it will interact with `/var/log`, it will need sudo-level permissions.
```bash
sudo log_archiver.sh
```

_Sample Output:_
```bash
=== Starting process to archive logs ===
------- Process Completed -------
Current Logs are listed in /root/log_backups.
```
