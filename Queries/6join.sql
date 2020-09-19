select t1.emp_no e1, t2.emp_no e2 
from dept_emp t1, dept_emp t2, employees t3, employees t4
where t1.dept_no = 'd001' and 
t2.dept_no = 'd001' and 
t1.emp_no <> t2.emp_no and 
t1.emp_no < t2.emp_no and 
t1.to_date = '9999-01-01' and 
t2.to_date = '9999-01-01' and 
t3.emp_no = t1.emp_no and
t4.emp_no = t2.emp_no and  
year(t3.birth_date) = '1955' and 
year(t4.birth_date) = '1955' 



