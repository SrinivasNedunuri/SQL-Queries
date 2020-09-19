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
