/*Find out departments which has changed its manager more than once then list
out the name of the departments and the number of changes. Sort the result
by department name. The result of query is similar to following table:
dept_name cnt
Customer Service 3
...*/

select q2.dept_name, q2.cnt from
(select d.dept_name, count(*) cnt from
(select * from dept_manager where to_date <> '9999-01-01') q1, departments d 
where d.dept_no = q1.dept_no
group by q1.dept_no
order by d.dept_name) q2
where q2.cnt > 1
