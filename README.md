Your README file is already structured well, but I can help refine it for better clarity, readability, and GitHub formatting. Here's an improved version:

---

### 🐧 Learning Linux: File Management Project

This project integrates fundamental Linux commands such as `pwd`, `cd`, `ls`, `cat`, `man`, `clear`, `exit`, `chmod`, and `mkdir` into a practical workflow. It provides a structured, hands-on experience to refine Linux skills. Additionally, I have used AI to generate simple scripts for automation, as I am still in the fundamental phase of learning Linux.

## 📁 Project: Setting Up and Managing a Simple Company File Management System

### 📝 Scenario

You have been hired to set up and manage a basic file management system on a Linux server for a small company. The company needs directories for multiple departments (e.g., HR, Finance, Marketing), with appropriate files and structures for their operations. You will also perform basic navigation and file management tasks.

### 🎯 Objectives

1. **Create and organize** a directory structure for the company.
2. **Populate files** with dummy data and display content for review.
3. **Use system commands** to manage and navigate the system effectively.
4. **Write a simple shell script** to automate directory creation and organization.
5. **Document the process** using `man` and other commands.

---

## 🔧 Lab Steps

### 1️⃣ Initial Setup

```sh
# Open terminal and navigate to the working directory
pwd  
cd /path/to/project

# Clear screen
clear
```

### 2️⃣ Create a Directory Structure

```sh
# Create company directory
mkdir company

# Inside the company directory, create subdirectories
cd company
mkdir HR Finance Marketing

# Navigate into each department and create subfolders
cd HR && mkdir Policies && cd ..
cd Finance && mkdir Reports && cd ..
cd Marketing && mkdir Campaigns && cd ..
```

### 3️⃣ Populate Files with Dummy Data

```sh
# Creating files and adding content
echo "John Doe, Jane Smith, Mark Johnson" > HR/employee_list.txt
echo "Q1: $10,000, Q2: $15,000, Q3: $12,000" > Finance/quarterly_budget.txt
echo "Campaign 1: Social Media Blast" > Marketing/campaign_plan.txt
```

### 4️⃣ Display and Review Files

```sh
ls HR
cat HR/employee_list.txt
```

---

## ⚙️ Automating Directory Setup

### 📝 Shell Script: `setup_company.sh`

```bash
#!/bin/bash

# Create directory structure
mkdir -p company/HR/Policies
mkdir -p company/Finance/Reports
mkdir -p company/Marketing/Campaigns

# Populate files with dummy data
echo "John Doe, Jane Smith, Mark Johnson" > company/HR/employee_list.txt
echo "Q1: $10,000, Q2: $15,000, Q3: $12,000" > company/Finance/quarterly_budget.txt
echo "Campaign 1: Social Media Blast" > company/Marketing/campaign_plan.txt

echo "Company directories and files set up successfully!"
```

### 🏃 Execution

```sh
chmod +x setup_company.sh
./setup_company.sh
```

---

## 🚀 Additional Challenges

### 📝 Challenge 1: Logging Actions in `script.log`

Modify `setup_company.sh` to log each step.

```bash
#!/bin/bash

LOG_FILE="script.log"

log_message() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> $LOG_FILE
}

mkdir -p company/HR/Policies && log_message "Created directory: company/HR/Policies"
mkdir -p company/Finance/Reports && log_message "Created directory: company/Finance/Reports"
mkdir -p company/Marketing/Campaigns && log_message "Created directory: company/Marketing/Campaigns"

echo "John Doe, Jane Smith, Mark Johnson" > company/HR/employee_list.txt && log_message "Created file: company/HR/employee_list.txt"
echo "Q1: $10,000, Q2: $15,000, Q3: $12,000" > company/Finance/quarterly_budget.txt && log_message "Created file: company/Finance/quarterly_budget.txt"
echo "Campaign 1: Social Media Blast" > company/Marketing/campaign_plan.txt && log_message "Created file: company/Marketing/campaign_plan.txt"

echo "Setup completed. Check $LOG_FILE for details."
```

### 🏃 Execution

```sh
chmod +x setup_company.sh
./setup_company.sh
cat script.log
```

---

### 📝 Challenge 2: Backup Script `backup.sh`

```bash
#!/bin/bash

BACKUP_DIR="backups"
SOURCE_DIR="company"
DATE=$(date '+%Y-%m-%d')
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

mkdir -p $BACKUP_DIR
tar -czf $BACKUP_FILE $SOURCE_DIR
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup created: $BACKUP_FILE" >> backup.log

echo "Backup completed. File: $BACKUP_FILE"
```

### 🏃 Execution

```sh
chmod +x backup.sh
./backup.sh
ls backups/
cat backup.log
```

---

### 📝 Challenge 3: Recovery Script `recovery.sh`

```bash
#!/bin/bash

BACKUP_DIR="backups"
RESTORE_DIR="company"
LOG_FILE="recovery.log"

LATEST_BACKUP=$(ls -t $BACKUP_DIR/backup_*.tar.gz | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] No backup file found." >> $LOG_FILE
    echo "No backup available for recovery."
    exit 1
fi

tar -xzf $LATEST_BACKUP -C .
if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Successfully recovered company directory." >> $LOG_FILE
    echo "Recovery successful."
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Recovery failed." >> $LOG_FILE
    echo "Recovery failed. Check $LOG_FILE for details."
fi
```

### 🏃 Execution

```sh
chmod +x recovery.sh
./recovery.sh
ls company/HR
cat recovery.log
```

---

## 🗂 Summary of Scripts

| File Name     | Description                                |
| ------------- | ------------------------------------------ |
| `setup.sh`    | Creates directories and files with logging |
| `backup.sh`   | Creates a compressed backup archive        |
| `recovery.sh` | Restores lost files from backup            |

---

### 📌 Notes

- These scripts help automate Linux directory management tasks.
- Logs provide transparency in operations.
- Backup and recovery ensure data safety.

---


