/*
Створи файл print_project_prices.sql.
У ньому напиши SQL, який виведе список проєктів та вартість кожного проєкту.
Вартість проєкту - це сума заробітних плат працівників, що працюють над цим проєктом, помножених на тривалість у місяцях проєкту.
Наприклад, над проєктом Project A працюють працівники Max (заробітна плата 1000) та Joe (заробітна плата 1500).
Проєкт триває 17 місяців. Тоді вартість проєкту Project A = 17 * (1000 + 1500) = 42500
Відсортуй проєкти по спаданню - спочатку виведи найдорожчі проєкти.
*/

\echo
\echo 'Prices for project development'
\echo
SELECT project.name as name,
SUM(worker.salary * TRUNC (
	    extract(year FROM age(project.finish_date, project.start_date)) * 12 +
	    extract(day FROM age(project.finish_date, project.start_date)) / 30 +
		extract(month FROM age(project.finish_date, project.start_date))
	, 1)) as price
FROM project_worker
JOIN worker ON worker.id = project_worker.worker_id
JOIN project ON project.id = project_worker.project_id
GROUP BY project.name
ORDER BY price DESC;

/*
SELECT 
  rpad(project.name, 10) as name,
  rpad(SUM(worker.salary * TRUNC (
	    extract(year FROM age(project.finish_date, project.start_date)) * 12 +
	    extract(day FROM age(project.finish_date, project.start_date)) / 30 +
		extract(month FROM age(project.finish_date, project.start_date))
	, 1))::text, 20) as price
FROM project_worker
JOIN worker ON worker.id = project_worker.worker_id
JOIN project ON project.id = project_worker.project_id
GROUP BY project.name
ORDER BY price DESC;
*/