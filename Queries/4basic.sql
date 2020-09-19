select de.emp_no, d.dept_name, de.from_date
from dept_emp de, departments d
where de.dept_no = d.dept_no and de.to_date = '9999-01-01'
order by de.emp_no