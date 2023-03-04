# SQL code was written for PostgreSQL 15.2
### To quickly test SQL queries, the following console commands can be used:

### Creating and accessing the database
```sh
psql -U postgres -c "CREATE DATABASE megasoft" && psql -U postgres -d megasoft
```
### Creating tables
```sh
\i /path/to/module_3_dev/init_db.sql
```
### Initializing tables
```sh
\i /path/to/module_3_dev/populate_db.sql
```
### Finding the employee with the highest salary
```sh
\i /path/to/module_3_dev/find_max_salary_worker.sql
```
### Finding the client with the most projects
```sh
\i /path/to/module_3_dev/find_max_projects_client.sql
```
### Finding the longest project
```sh
\i /path/to/module_3_dev/find_longest_project.sql
```
### Finding the youngest and oldest worker
```sh
\i /path/to/module_3_dev/find_youngest_eldest_workers.sql
```
### Displaying project names and development costs.
```sh
\i /path/to/module_3_dev/print_project_prices.sql
```