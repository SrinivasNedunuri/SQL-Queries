/*List the number of employees in each department. Sort the result by department
name. The result of query is similar to following table:
dept_name noe
Customer Service 23580
Development 85707
...*/

select de.dept_name, count(d.dept_no) noe from departments de, dept_emp d
where de.dept_no = d.dept_no 
group by d.dept_no order by de.dept_name
