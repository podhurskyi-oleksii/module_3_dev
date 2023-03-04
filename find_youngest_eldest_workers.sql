/*
Створи файл find_youngest_eldest_workers.sql.
У ньому напиши SQL, який вибере наймолодшого та найстаршого працівників, та виведе їх у форматі таблиці з наступними полями:
 - TYPE - тип (може бути YOUNGEST або OLDEST)
 - NAME - ім'я працівника
 - BIRTHDAY - дата народження працівника
Якщо є декілька наймолодших/найстарших працівників - то необхідно вивести їх всіх.
*/

\echo
\echo 'The Youngest and Oldest workers'
\echo
SELECT  
  CASE 
    WHEN birthday = (SELECT MAX(birthday) FROM worker) THEN 'Youngest'
    WHEN birthday = (SELECT MIN(birthday) FROM worker) THEN 'Eldest'
    ELSE ''
  END AS type,
  name,
  birthday
FROM worker
WHERE birthday = (SELECT MIN(birthday) FROM worker) 
	OR birthday = (SELECT MAX(birthday) FROM worker)
ORDER BY birthday DESC;