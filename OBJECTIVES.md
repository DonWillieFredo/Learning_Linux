------------------------------

This project integrates linux fundamental commands such as (pwd, cd, ls, cat, man, clear, exit, chmod, mkdir) in a practical workflow, providing a structured, hands-on experience to refine my Linux skills.In the section where Additional Challenges were added I used the AI tool to provide simple scripts (as I am still in the fundamental phases of learning linux)

------------------------------

Project: Setting Up and Managing a Simple Company File Management System

Scenario:

You have been hired to set up and manage a basic file management system on a Linux server for a small company. The company needs directories for multiple departments (e.g., HR, Finance, Marketing), with appropriate files and a structure for their operations. You'll also perform basic navigation and file management tasks.

Objectives:

1. Create and organize a directory structure for the company.
2. Populate files with dummy data and display content for review.
3. Use system commands to manage and navigate the system effectively.
4. Write a simple shell script to automate directory creation and organization.
5. Document the process using man and other commands.

Lab Steps:

1. Initial Setup
Open a terminal, navigate to working directory using [cd, and pwd], and [clear] the screen using clear for a fresh start.
Use [cd] to navigate to the base directory for the project. 
Create a project directory named company [mkdir]company.

2. Create a Directory Structure
Inside the company directory, create subdirectories for each department:
[mkdir]
HR
Finance
Marketing

[cd, cd .., mkdir]
Navigate into each directory using cd and create additional subdirectories, such as:
HR/Policies
Finance/Reports
Marketing/Campaigns

For example: 
cd HR 
mkdir Policies

3. Populate Files with Dummy Data
Navigate to each department folder and create placeholder files using [cat].
Examples:
HR/employee_list.txt (contains a list of employee names)
Finance/quarterly_budget.txt (contains dummy budget data)
Marketing/campaign_plan.txt (contains a mock campaign description)

example:
cd HR
cat > employee_list.txt
(type in dummy names press Ctrl+D to save)
or:
echo "John Doe, Jane Smith, Mark Johnson" > company_files/HR/employee_list.txt

4. Display and Review Files
Use the [ls] command to verify the files and directories.
Use [cat] to display the content of each file for review. Example:

example: 
cd HR
ls
cat employee_list.txt

[I used AI to create a script to Automate Directory Setup]

5. Create a Shell Script to Automate Directory Setup
Write a script setup_company.sh to automate creating the entire directory structure and dummy files.

cat > setup_company.sh
# Write the script below and press Ctrl+D to save:
------------------------------

#!/bin/bash
mkdir -p company_files/HR/Policies
mkdir -p company_files/Finance/Reports
mkdir -p company_files/Marketing/Campaigns

echo "John Doe, Jane Smith, Mark Johnson" > company_files/HR/employee_list.txt
echo "Q1: $10,000, Q2: $15,000, Q3: $12,000" > company_files/Finance/quarterly_budget.txt
echo "Campaign 1: Social Media Blast" > company_files/Marketing/campaign_plan.txt

-----------------------------
options to create script: vi or nano
------------------------------
Make script executable:
chmod +x setup_company.sh

6. Explore the Manual and Documentation
Use man to explore the commands used and document their purpose in a file called commands_used.txt:
example: man chmod >> commands_used.txt

to review and verify the file run:
cat commands_used.txt

7. Exit and clean up
exit

----------
Additional Challenges added to the project:
these additional challenges provide a well-rounded experience with shell scripting(I used AI to help write scripts), backups, logging, and disaster recover.
----------
STEPS:
1. Modify the Shell Script to Add Logs
Enhance the shell script to log messages after creating each directory and file. 
These logs should include timestamps to indicate when each operation was performed. 
Save the logs to a file named script.log in the root directory.

Example:
Log format: [YYYY-MM-DD HH:MM:SS] Created directory: path_to_directory
Example entry: [2025-02-16 12:30:45] Created directory: /company/HR

2. Add a Backup Script Using tar
Write a separate shell script named backup.sh to create a compressed archive of the entire company directory.
This archive should be saved in a backups directory and include the current date in its filename for versioning.

Requirements:
Use the tar command to create the archive.
The backup file should be named as backup_YYYY-MM-DD.tar.gz.
Ensure the backups directory exists before saving the backup file.

3. Simulate User Error and Recover from Backup
Simulate a scenario where a user accidentally deletes a file in the company_files directory.
Then, recover the deleted file from the latest backup using the tar command.

----------
STEPS:

    1. Simulate User Error:
        Delete a specific file in the company_files Directory
        (e.g., /company/HR/employee_list.txt).
    2. Recover the File:
        Extract the deleted file from the latest backup archive into its original location.


Additional Task:
Log the recovery process in a file named recovery.log.
Include the filename, timestamp, and whether the recovery was successful.
----------


Setup Guide for Additional Challenges:

Challenge 1: Modify the Shell Script to Add Logs

Steps to Implement Logging

    1. Open shell script that creates directories and files (e.g., setup.sh).
    2. Add a function to append log messages to a script.log file.

example:
----------
#!/bin/bash

LOG_FILE="script.log"

#Function to log messages
log_message() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> $LOG_FILE
}


mkdir -p company/Finance/Reports
log_message "Created directory: company/Finance/Reports"
mkdir -p company/Marketing/Campaigns
log_message "Created directory: company/Marketing/Campaigns"
mkdir -p company/HR/Policies
log_message "Created directory: company/HR/Policies"

echo "John Doe, Jane Smith, Mark Johnson" > company/HR/employee_list.txt
log_message "Created file: company/HR/employee_list.txt"
echo "Q1: $10,000, Q2: $15,000, Q3: $12,000" > company/Finance/quarterly_budget.txt
log_message "Created file: company/Finance/quarterly_budget.txt"
echo "Campaign 1: Social Media Blast" > company/Marketing/campaign_plan.txt
log_message "Created file: company/Marketing/campaign_plan.txt"

echo "Setup completed. Check $LOG_FILE for details."

----------


Execution

    1. Save the script as setup.sh.
    2. Run it: bash setup.sh or ./setup.sh
    3. Check the script.log file in the same directory to verify the logs.

----------

Challenge 2: Add a Backup Script Using tar

Steps:
    
    Create a new script named backup.sh

------------------


#!/bin/bash

BACKUP_DIR="backups"
SOURCE_DIR="company"
DATE=$(date '+%Y-%m-%d')
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Ensure the backup directory exists
mkdir -p $BACKUP_DIR

# Create the backup
tar -czf $BACKUP_FILE $SOURCE_DIR

# Log the backup process
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup created: $BACKUP_FILE" >> backup.log

echo "Backup completed. File: $BACKUP_FILE"

-------------------

Execution:

    1. Save the script as backup.sh.
    2. Make it executable: chmod +x backup.sh
    3. Run it: bash backup.sh or ./backup.sh
    4. Check the backup.log file and verify the archive exists in the backups directory.

----------


Challenge 3: Simulate User Error and Recover from Backup.

Steps to Simulate and Recover:

    1. Simulate User Error:
        Delete a specific file (e.g., company_files/hr/employee_list.txt):
        (rm company/HR/employee_list.txt)


    2. Recover the Files
        Extract the file from the latest backup.
        Create a recover script [recovery.sh]

----------
#!/bin/bash

BACKUP_DIR="backups"
RESTORE_DIR="company"
LOG_FILE="recovery.log"

# Find the latest backup file
LATEST_BACKUP=$(ls -t $BACKUP_DIR/backup_*.tar.gz | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] No backup file found." >> $LOG_FILE
    echo "No backup available for recovery."
    exit 1
fi

# Restore the deleted file
tar -xzf $LATEST_BACKUP -C . $RESTORE_DIR/hr/employee_list.txt 2>> $LOG_FILE

if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Successfully recovered: $RESTORE_DIR/hr/employee_list.txt" >> $LOG_FILE
    echo "File recovered successfully."
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Failed to recover: $RESTORE_DIR/hr/employee_list.txt" >> $LOG_FILE
    echo "Recovery failed. Check $LOG_FILE for details."
fi

--------------------

Execution

    1. Save the script as recovery.sh.
    2. make the script executable: chmod +x recover.sh
    3. Run it: bash recovery.sh. or ./recovery.sh
    4. Verify the file exists in its original location (company/HR/employee_list.txt).
    5. Check the recovery.log for details.

Summary of Files

    * setup.sh: Creates directories, files, and logs the operations.
    * backup.sh: Archives the company_files directory with versioned backups and logs the process.
    * recovery.sh: Recovers deleted files from the latest backup and logs the recovery process.


