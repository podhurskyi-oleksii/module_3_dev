/*
Створи файл find_max_salary_worker.sql.
У ньому напиши SQL, який виведе працівника з найбільшою заробітною платою.
Якщо таких працівників декілька - потрібно вивести всіх.
*/

\echo
\echo 'Worker with higher salary'
\echo
SELECT name, salary FROM worker
WHERE  salary=(SELECT MAX(salary) FROM worker);