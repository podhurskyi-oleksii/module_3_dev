/*
Створи файл find_longest_project.sql.
У ньому напиши SQL, який виведе проєкт з найбільшою тривалістю в місяцях.
Якщо таких проєктів декілька - потрібно вивести всі ці проєкти.
*/

\echo
\echo 'The longest project'
\echo
SELECT name, TRUNC (
	    extract(year FROM age(project.finish_date, project.start_date)) * 12 +
	    extract(day FROM age(project.finish_date, project.start_date)) / 30 +
		extract(month FROM age(project.finish_date, project.start_date))
	, 1) as months_count
FROM project
WHERE TRUNC (
	    extract(year FROM age(project.finish_date, project.start_date)) * 12 +
	    extract(day FROM age(project.finish_date, project.start_date)) / 30 +
		extract(month FROM age(project.finish_date, project.start_date)), 1) = (
		SELECT MAX(months_count) FROM (
			SELECT TRUNC (
	    	extract(year FROM age(project.finish_date, project.start_date)) * 12 +
	    	extract(day FROM age(project.finish_date, project.start_date)) / 30 +
			extract(month FROM age(project.finish_date, project.start_date)), 1) as months_count 
			FROM project) subquery
		);