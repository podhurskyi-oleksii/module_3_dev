/*
Створи файл find_max_projects_client.sql.
У ньому напиши SQL, який виведе клієнта з найбільшою кількістю проєктів.
Якщо таких клієнтів декілька - потрібно вивести всіх.
*/

\echo
\echo 'Client with the highest number of projects'
\echo
SELECT client.name, COUNT(*) as project_count
FROM project
JOIN client ON project.client_id = client.id
GROUP BY client.name
HAVING COUNT(*)= (
	SELECT MAX(project_count) 
	FROM(
		SELECT COUNT(*) as project_count
		FROM project
		GROUP BY client_id
		) as subquery
	);