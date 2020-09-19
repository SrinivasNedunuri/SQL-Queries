/*Find all female employees and sort the result by employee number. The result
of query is similar to following table:
emp_no birth_date first_name last_name gender hire_date
10002 1964-06-02 Bezalel Simmel F 1985-11-21
10006 1953-04-20 Anneke Preusig F 1989-06-02
...*/


select * from employees where gender = 'F'
