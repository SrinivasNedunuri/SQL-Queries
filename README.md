# SQL-Queries
Basic and Advanced Queries including recursive queries
This project demonstrates SQL queries from basic to advanced topics on the employees database.
# Database: Employees
Follow the steps below to install the project database
1. Download the GitHub Repository: https://github.com/datacharmer/
test_db
2. Launch command line console, change the working directory to your downloaded repository
3. Type following command:
mysql < employees.sql
or
mysql -u YOUR MY SQL USER NAME -p < employees.sql
This will initialize your database.
4. To verify installation, run following commands:
mysql -t < test employees md5.sql
or
mysql -u YOUR MY SQL USER NAME -p < test employees md5.sql

Only following MySQL functions are used during constructing
SQL Queries:
• AVG
• COUNT
• DATEDIFF
• MIN
• YEAR
