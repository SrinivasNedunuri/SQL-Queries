WITH recursive TitleCTE AS (
	select t1, t2, avg(years) + 1 years 
    from (select t1.title t1, t2.title t2, year(t2.from_date) - year(t1.from_date) years
		 from titles t1, titles t2 
		 where t1.emp_no = t2.emp_no and t1.title <> t2.title and t1.to_date = t2.from_date) q1
    group by t1, t2
    
	union all

	select tab2.t1 , q1.tit2, q1.years + tab2.years  
    from (select tit1, tit2, avg(years) +1 years 
		 from (select t1.title tit1, t2.title tit2, year(t2.from_date) - year(t1.from_date) years
				from titles t1, titles t2 
				where t1.emp_no = t2.emp_no and t1.title <> t2.title and t1.to_date = t2.from_date) q1
		 group by tit1, tit2) q1
	join
	TitleCTE tab2 on q1.tit1 = tab2.t2 and tab2.t2 <>'Staff' and tab2.t2 <>'Senior staff' and tab2.t2 <>'Technique Leader'
)

select distinct t1 src, t2 dst, years 
from  TitleCTE 
where t1<>t2
group by t1,t2
order by t1, t2

