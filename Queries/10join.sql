/* Find out those pairs of employees (eH; eL) which satisfy ALL following conditions:
1. Both eH and eL born in 1965
2. eH’s current salary is higher than eL’s current salary
3. eH’s hiring date is greater than eL, which means eH is a newer employee
than eL.
Sort the result by employee number of eH then employee number of el.
Result is shown as table below:
4h_empno h_salary h_date l_empno l_salary l_date
10095 80955 1986-07-15 13499 58029 1985-11-25
10095 80955 1986-07-15 14104 61757 1986-01-02
10095 80955 1986-07-15 17206 55078 1986-02-25
10095 80955 1986-07-15 18617 66957 1986-06-28
...
• h empno : eH’s employee number
• h salary : eH’s current salary
• h date : eH’s hire date
• l empno : eL’s employee number
• l salary : eL’s current salary
• l date : eL’s hire date */


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

