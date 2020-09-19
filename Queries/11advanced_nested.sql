/*
Find the employee with highest current salary in each department. Note that
MAX function is not allowed. Sort the result by department name. Result is
shown as table below:
dept_name emp_no salary
Customer Service 18006 144866
Development 13386 144434
...*/




select q2.dept_name, q1.emp_no, q2.salary 
from (select q1.dept_no, d.dept_name, min(-1 * q1.salary)*(-1) salary 
	 from (select d.dept_no, d.emp_no, s.salary 
			from dept_emp d, salaries s 
			where d.emp_no = s.emp_no and 
            s.to_date = '9999-01-01' and 
            d.to_date = '9999-01-01') q1, departments d
	 where d.dept_no = q1.dept_no
	 group by d.dept_no) q2,
	(select s1.emp_no, s1.salary, d.dept_no 
	from salaries s1, dept_emp d
	where s1.to_date = '9999-01-01' and 
	s1.emp_no = d.emp_no and 
	d.to_date = '9999-01-01') q1
where q1.salary = q2.salary and 
q1.dept_no = q2.dept_no
order by q2.dept_name
