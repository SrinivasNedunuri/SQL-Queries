/*For each employee, find out how many times the title has been changed without
chaning of the salary. e.g. An employee promoted from Engineer to Sr. Engineer
with salaries remains 10k. Sort the result by employ number. The result of query
is similar to following table:
emp_no cnt
10004 1
10005 1
10007 1
10009 2
...*/


select emp_no, count(*) cnt 
from titles 
where from_date not in 
	(select from_date from salaries where emp_no = titles.emp_no) 
group by emp_no
order by emp_no
