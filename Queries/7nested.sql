select m.emp_no, d.dept_name 
from dept_manager m, departments d
where (m.emp_no, m.dept_no) not in 
	(select m1.emp_no, m1.dept_no 
    from dept_manager m1, dept_manager m2 
	where m1.to_date <> '9999-01-01' and 
	m2.to_date <> '9999-01-01' and 
	m1.dept_no = m2.dept_no and 
    datediff(m1.to_date, m1.from_date) < datediff(m2.to_date, m2.from_date)) 
and m.dept_no = d.dept_no 
and m.to_date <> '9999-01-01'
order by m.emp_no