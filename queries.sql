--Employees Retiring
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Count of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--create sales retirement info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
INTO retirement_info_sales
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01')
	AND (dept_name = 'Sales');

--create sales and developement retirement info
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name
--INTO retirement_info_sales_dev
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01')
	AND (dept_name IN ('Sales', 'Development'));

-- create retiring titles table
SELECT ti.title, 
	e.emp_no,
	e.first_name,
	e.last_name,
	s.salary
INTO retiring_titles
FROM employees as e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (ti.to_date = '9999-01-01');

DROP TABLE retiring_titles
-- create retiring titles table
SELECT ti.title,
	ti.from_date,
	e.emp_no,
	e.first_name,
	e.last_name,
	s.salary
INTO retiring_titles
FROM employees as e
INNER JOIN salaries AS s
ON (e.emp_no = s.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
    AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	
select *
from retiring_titles
group by title

SELECT
	first_name,
	last_name,
  	count(*)
FROM retiring_titles
GROUP BY
	first_name,
	last_name
HAVING count(*) > 1;

SELECT * FROM
(SELECT *, COUNT(*)
	OVER
	(PARTITION BY
		first_name,
		last_name
	) AS COUNT
 	FROM retiring_titles) table_with_count
  WHERE table_with_count.count > 1;

SELECT title,
	from_date,
	emp_no,
	first_name,
	last_name,
	salary
INTO retiring_titles_no_dup
FROM
(SELECT title,
	from_date,
	emp_no,
	first_name,
	last_name,
	salary, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY from_date DESC) rn
 FROM retiring_titles
 ) tmp WHERE rn = 1
ORDER BY emp_no;

select title,
	count(*)
into retiring_titles_count
from retiring_titles_no_dup
group by title

SELECT ti.title,
	e.emp_no,
	e.first_name,
	e.last_name,
	de.from_date,
	de.to_date
INTO mentors
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');

SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date
INTO mentors_no_dup
FROM
(SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date, ROW_NUMBER() OVER
 (PARTITION BY (emp_no)
 ORDER BY from_date DESC) rn
 FROM mentors
 ) tmp WHERE rn = 1
ORDER BY emp_no;