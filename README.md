# 🧑‍💻 Project 02 – User Management in Bash

📌 Description

Bash script to automate user management in Linux systems. Features include:

Create users
Assign them to groups
Set permissions for their home directory
Configure account expiration date
Log all actions to /var/log/user_admin.log

This project is part of my specialization in Cybersecurity + Linux Automation, leveraging Bash as a key tool for SysAdmin tasks.

⚙️ Usage
sudo ./user_admin.sh -c username -g group -e expiration_date -p permissions


📘 Options:

Flag	Description
-c	  Username to create
-g	  Group to assign
-e	  Account expiration date (YYYY-MM-DD)
-p	  Permissions for /home/username (e.g., 700)
-h	  Show help menu

📝 Example:

sudo ./user_admin.sh -c john -g networks -e 2025-12-31 -p 700


Result:

Creates the user john
Creates and assigns to the group networks (if it doesn’t exist)
Sets account expiration to December 31, 2025
Applies 700 permissions to the home directory
Logs all actions in /var/log/user_admin.log

🧠 Commands Used

useradd, groupadd, usermod, chage
chmod, chown, getent
getopts, logger, date

📁 Action Log

Stored in: /var/log/user_admin.log

Example log:

2025-08-06 14:10:02 - User 'john' created successfully.
2025-08-06 14:10:02 - Group 'networks' created.
2025-08-06 14:10:02 - User 'john' added to group 'networks'.
2025-08-06 14:10:02 - Account for 'john' will expire on 2025-12-31.
2025-08-06 14:10:02 - Permissions for /home/john set to 700.
