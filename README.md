# Organisation Database (MySQL)

## Description
A MySQL relational database for managing an organisation's data.  
Includes tables for employees, departments, projects, teachers, workers, students, and courses — with relationships, primary keys, and foreign keys.

## Tables

| Table | Description |
|-------|-------------|
| `employees` | Stores employee info — name, department, salary, city |
| `worker` | Another worker table with department and salary data |
| `department` | Department names and IDs |
| `DEPT` | Used for teacher-department relationships |
| `TEACHER` | Teachers linked to departments via foreign key |
| `projects` | Projects with budget and assigned employee |
| `student` | Student names and IDs |
| `course` | Courses linked to students |

## Features
- Relational tables with primary and foreign keys
- `ON DELETE CASCADE` and `ON UPDATE CASCADE` constraints
- Sample data included for all tables
- Subquery and aggregate function examples included

## Tools
- MySQL 9.5
- MySQL Workbench

## Usage

1. Clone the repository:
```bash
git clone https://github.com/m2ammar/Organisation-database-mysql.git
```

2. Import the database:
```bash
mysql -u root -p < Organisation.sql
```

3. Open MySQL and use the database:
```sql
USE Organisation;
SHOW TABLES;
```
