select de.dept_name, count(d.dept_no) noe from departments de, dept_emp d
where de.dept_no = d.dept_no 
group by d.dept_no order by de.dept_name