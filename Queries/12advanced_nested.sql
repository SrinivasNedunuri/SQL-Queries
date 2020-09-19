/*Calculate the percentage of number of employees’ current salary is above the
department current avarage. Sort the result by department name. The result
is shown as following:
dept_name above_avg_pect
Customer Service 44.4988
Development 46.6018
...
As the figure shows, there are 51.9825 % employees in Development department
has their current salary above the average of current salary in Development
department.*/



select q3.dept_name, (cnt1/cnt)*100 above_avg_pect from
 (select *, count(q1.salary) cnt1 from
(select q1.dept_no, d.dept_name, avg(q1.salary) avg_sal, count(q1.salary) cnt from 
(select d.dept_no, d.emp_no, s.salary from dept_emp d, salaries s 
where d.emp_no = s.emp_no and s.to_date = '9999-01-01' and d.to_date = '9999-01-01') q1, departments d
where d.dept_no = q1.dept_no
group by d.dept_no) q2

join

(select d.dept_no d2, d.emp_no, s.salary from dept_emp d, salaries s 
where d.emp_no = s.emp_no and s.to_date = '9999-01-01' and d.to_date = '9999-01-01') q1

on q1.d2 = q2.dept_no and q1.salary>q2.avg_sal

group by dept_no) q3
order by dept_name
