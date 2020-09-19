/*List pairs of employee (e1; e2) which satisfies ALL following conditions:
1. Both e1 and e2’s current department number is d001.
2. The year of birthdate for e1 and e2 is 1955.
3. The e1’s employee number is less than e2.
Sort the result by e1 then e2. The result of query is similar to following table:
e1 e2
10239 10367
10239 11251
...
10367 11251
10367 11554
...*/

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



