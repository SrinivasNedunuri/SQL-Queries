select emp_no, count(*) cnt 
from titles 
where from_date not in 
	(select from_date from salaries where emp_no = titles.emp_no) 
group by emp_no
order by emp_no