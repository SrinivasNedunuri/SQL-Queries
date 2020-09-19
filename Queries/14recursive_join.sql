/*Continued from problem 13, assumeing we treat the years from beginning of a
title until promotion as the distance between nodes. e.g. An employee started as
an Assistant Engineer from 1950-01-01 to 1955-12-31 then be promoted to Engineer on 1955-12-31. Then there is an edge between node "Assistant Engineer"
to "Engineer" with distance 6.
Calculate the average distance of all possible pair of titles and ordered by
source node. To simplify the problem, there is no need to consider months and
date when calculating the distance. Only year is required for calculating the
distance. Besides, we can assume the distances of any given pair is less than
100.
Sort the result by src then dst. The expected result is shown as follow:
src dst years
Assistant Engineer Engineer 7.7926
Assistant Engineer Manager 20.5266
...
Engineer Manager 12.7340
...
As the table shows, the average distance between node "Assistant Engineer" and
node "Engineer" is 7.7926. We add it with the distance between "Engineer"
to "Manager", which is 12.7340, to find out the distance between "Assistant
Engineer" to "Manager" is 20.5266.*/



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

