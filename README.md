# Task - 05 - SQL Joins (INNER, LEFT, RIGHT, FULL)

## Overview
This task focuses on writing and executing **SQL join queries** in MySQL.  
It demonstrates how to combine data from multiple related tables and explore different types of joins.

## Tools Used
- MySQL Workbench  

## Objectives
- Understand and apply different types of SQL joins:
  - `INNER JOIN` – return rows with matching values in both tables  
  - `LEFT JOIN` – return all rows from the left table, matched rows from the right  
  - `RIGHT JOIN` – return all rows from the right table, matched rows from the left  
  - `FULL OUTER JOIN` (emulated with `UNION` in MySQL) – return all rows from both tables  
- Learn additional join concepts:
  - Self Join  
  - Cross Join  
  - Joining more than 2 tables  
  - Emulating Natural Joins  
- Practice building queries that merge related data for analysis  

## Deliverables
- `task-5-joins.sql` (SQL script of join queries)  
- Screenshots of query results (INNER, LEFT, RIGHT, FULL, etc.)  
- Documentation in `README.md`  

## Example Queries
- **INNER JOIN**: Orders with their customers  
- **LEFT JOIN**: Customers and their orders (including those without orders)  
- **RIGHT JOIN**: Employees who are sales reps with their assigned customers/orders  
- **FULL OUTER JOIN**: Products with or without order details  
- **Self Join**: Employees and their managers  
- **Cross Join**: Offices × Product Lines (Cartesian product)  
- **3-table Join**: Orders + Order Details + Products  

## Key Learnings
- Joins are essential for working with relational databases.  
- Choosing the correct join type depends on whether you want **only matching data** or **all rows from one/both tables**.  
- MySQL does not directly support `FULL OUTER JOIN`, so it must be simulated with `UNION`.  
- Always use appropriate indexes and join conditions to optimize performance.  

## Author
Syed Ahmed Ali  
