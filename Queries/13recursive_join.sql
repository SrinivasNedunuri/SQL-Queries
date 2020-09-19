WITH recursive TitleCTE AS (
	select distinct t1.title t1, t2.title t2
	from titles t1, titles t2 
	where t1.emp_no = t2.emp_no and t1.from_date < t2.from_date

	union all

	select tab2.t1 , q1.tit2  from (select distinct t1.title tit1, t2.title tit2
	from titles t1, titles t2 
	where t1.emp_no = t2.emp_no and t1.from_date < t2.from_date) q1
	join
	TitleCTE tab2 on q1.tit1 = tab2.t2 and tab2.t2 <>'Staff' and tab2.t2 <>'Senior staff' and tab2.t2 <>'Technique Leader'
)

select distinct q1.src src, q1.dst dst 
from (select distinct q1.title src, q2.title dst 
	 from (SELECT distinct title FROM employees.titles) q1, (SELECT distinct title FROM employees.titles) q2) q1
where (src, dst) not in (select * from  TitleCTE) and dst <> 'Manager'
order by src, dst 