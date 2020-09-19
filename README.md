# SQL-Queries
Basic and Advanced Queries including recursive queries.
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

# Tables
1. departments  columms - dept_no, dept_name
2. dept_emp     columns - emp_no, dept_no, from_date, to_date
3. dept_manager columns - emp_no, dept_no, from_date, to_date
4. employees    columns - emp_no, first_name, last_name, birth_date, gender, hire_date
5. salaries     columns - emp_no, salary, from_date, to_date
6. titles       columns - emp_no, title, from_date, to_date
    
