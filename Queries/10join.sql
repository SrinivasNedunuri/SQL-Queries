select h.emp_no h_empno, h_sal.salary h_salary, h.hire_date h_date, l.emp_no l_empno, l_sal.salary l_salary, l.hire_date l_date 
from employees h, employees l, salaries h_sal, salaries l_sal
where h.emp_no = h_sal.emp_no and 
l.emp_no = l_sal.emp_no and 
year(h.birth_date)= 1965 and year(l.birth_date) = 1965 
and h.hire_date > l.hire_date and 
h_sal.salary > l_sal.salary and 
h_sal.to_date = '9999-01-01' and 
l_sal.to_date = '9999-01-01'
order by h_empno, l_empno

