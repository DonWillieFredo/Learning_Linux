#!/bin/bash

LOG_FILE="script.log"

#Function to log messages
log_message() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> $LOG_FILE
}

# mkdir -p company/HR/Policies
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
