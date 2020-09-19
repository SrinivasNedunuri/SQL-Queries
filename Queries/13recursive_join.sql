/*Assuming a title is a node and a promotion is an edge between nodes. e.g.
And promotion from Engineer to Senior Engineer means their is a path from
Node ’Engineer’ to Node ’Senior Engineer’. Find out pairs of node of source
and destination (src, dst) which there is no such path in the database. Sort the
result by src then dst. The result is shown as following:
src dst
Assistant Engineer Assistant Engineer
Engineer Assistant Engineer
...
The result table shows that there is no path from Assistant Engineer to Assistant
Engineer and neither Engineer to Assistant Engineer. That means there is no
one have been from Engineer and be promoted/demoted to Assistant Engineer
(no matter how many times of promotion/demotion) in the database. */


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
