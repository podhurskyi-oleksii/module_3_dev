/*
Створи файл init_db.sql, у якому змоделюй структуру бази даних для компанії MegaSoft згідно брифінгу. Мають бути наступні таблиці:

1) worker - таблиця для працівників. У таблиці мають бути наступні поля:
ID - ідентифікатор працівника, ціле число, сурогатний первинний ключ.
NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.
BIRTHDAY - дата народження. Рік у цій даті має бути більшим за 1900
LEVEL - рівень технічного розвитку працівника. Має бути обмеження - це поле не може бути NULL, значення поля може бути одним з - Trainee, Junior, Middle, Senior
SALARY - заробітна плата працівника за 1 місяць. Обмеження - ціле число, не менше 100 і не більше 100 000

2) client - таблиця для клієнтів. Мають бути наступні поля:
ID - ідентифікатор клієнта, ціле число, сурогатний первинний ключ.
NAME - ім'я працівника, рядок. Обмеження - не має бути NULL, довжина має бути від 2 до 1000 символів включно.

3) project - таблиця для проєктів. Мають бути наступні поля:
ID - ідентифікатор проєкту, ціле число, сурогатний первинний ключ.
CLIENT_ID - ідентифікатор клієнта, що замовив цей проєкт
START_DATE - дата початку виконання проєкту
FINISH_DATE - дата кінця виконання проєкту

4) project_worker - таблиця, що показує, які працівники над якими проєктами працюють. Поля таблиці:
PROJECT_ID - ідентифікатор проєкту. Зовнішній ключ для таблиці project(id)
WORKER_ID - ідентифікатор клієнту. Зовнішній ключ для таблиці worker(id)
первинний ключ для цієї таблиці - складений, пара (PROJECT_ID, WORKER_ID)
*/

CREATE TABLE worker (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL CHECK (LENGTH(name) >= 2 AND LENGTH(name) <= 100),
	birthday DATE CHECK (EXTRACT(year FROM birthday) > 1900),
	level VARCHAR(10) CHECK (level IN ('Trainee', 'Junior', 'Middle', 'Senior')),
	salary INTEGER CHECK (salary >= 100 AND salary <= 100000)
);

CREATE TABLE client (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL CHECK(LENGTH(name) >= 2 AND LENGTH(name) <= 100)
);

CREATE TABLE project (
	id BIGSERIAL PRIMARY KEY,
	name VARCHAR(20),
	client_id INTEGER REFERENCES client(id),
	start_date DATE,
	finish_date DATE
);

CREATE TABLE project_worker (
	project_id INTEGER NOT NULL REFERENCES project(id),
	worker_id INTEGER NOT NULL REFERENCES worker(id),
	PRIMARY KEY (project_id, worker_id)
);