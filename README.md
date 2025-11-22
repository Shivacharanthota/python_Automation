# 🐍 Python Automation Practice

Welcome to my **Python Automation Repository** 👋  
This repo is where I store and track all the small automation scripts I’ve been learning and building with Python.

---

## 🚀 Purpose
This repository helps me:
- Practice Python scripting
- Learn how to automate daily tasks
- Keep track of what I’ve learned
- Experiment with libraries like `os`, `subprocess`, `scapy`, and more

---

## 📂 Contents
| Script Name | Description |
|--------------|-------------|
| `ping.py` | Sends ICMP packets (ping) to test connectivity using Scapy |
| `file_cleanup.py` | Automates cleanup of temporary files |
| `rename_files.py` | Renames multiple files automatically |
| `backup_script.py` | Creates simple file or folder backups |
| `vm_health_check.sh` | Shell script to monitor VM health based on CPU, memory, and disk usage |

*(More scripts will be added as I continue learning.)*

---

## 🧠 What I’m Learning
- Basics of Python scripting  
- Network automation using `Scapy` and `socket`  
- File system automation with `os` and `shutil`  
- Error handling and logging  
- Using Git & GitHub for version control  
- Shell scripting for system monitoring and DevOps tasks

---

## ⚙️ How to Run
1. Clone this repo:
   ```bash
   git clone https://github.com/Shivacharanthota/python_Automation
   ```

2. Navigate to the repository:
   ```bash
   cd python_Automation
   ```

3. Run the desired script

---

## 🏥 VM Health Check Script

The `vm_health_check.sh` script is a comprehensive health monitoring tool for virtual machines that analyzes system resources and provides actionable health status reports.

### 📋 Overview
This script monitors three critical system resources:
- **CPU Usage**: Percentage of CPU currently in use
- **Memory Usage**: Percentage of RAM currently in use  
- **Disk Usage**: Percentage of disk space currently in use

### 🎯 Health Criteria
- **Healthy**: All resources (CPU, memory, disk) are below 60% utilization
- **Non-Healthy**: One or more resources exceed 60% utilization

### 🚀 Usage

#### Basic Usage (Simple Output)
```bash
./vm_health_check.sh
```
**Output Example:**
```
VM Health Status: Healthy
```

#### Detailed Usage (With Explanation)
```bash
./vm_health_check.sh explain
```
**Output Example:**
```
=== VM Health Status Report ===
Health Status: Non-Healthy

Resource Utilization:
  CPU Usage:    2.30%
  Memory Usage: 9.28%
  Disk Usage:   76%

Threshold: 60%

Health Analysis:
  ✅ CPU usage (2.30%) is within acceptable range
  ✅ Memory usage (9.28%) is within acceptable range
  ❌ Disk usage (76%) exceeds threshold (60%)

⚠️  Overall Status: One or more resources exceed the threshold. Action may be required.
```

### 🔧 Features
- **Real-time Monitoring**: Checks current system resource utilization
- **Simple & Detailed Modes**: Choose between quick status check or detailed analysis
- **Visual Indicators**: Uses ✅ and ❌ symbols for easy status recognition
- **Threshold-based Analysis**: Configurable 60% threshold for health determination
- **Actionable Insights**: Provides clear reasons when VM is unhealthy

### 📝 Requirements
- Linux/Unix-based system
- Standard utilities: `top`, `free`, `df`, `awk`
- Bash shell

### 💡 Use Cases
- **Automated Monitoring**: Run as a cron job to regularly check VM health
- **CI/CD Pipelines**: Verify VM resources before deploying applications
- **DevOps Alerts**: Integrate with alerting systems for proactive monitoring
- **Quick Health Checks**: Manual verification during troubleshooting

---

## 📄 License
This repository is for learning and personal use.
