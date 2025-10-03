-- INNER JOIN: show orders and their customer names
SELECT o.orderNumber, o.orderDate, o.status, c.customerNumber, c.customerName
FROM orders o
INNER JOIN customers c
  ON o.customerNumber = c.customerNumber
ORDER BY o.orderDate;


-- LEFT JOIN: every customer with their most recent order (NULL if none)
SELECT c.customerNumber, c.customerName, o.orderNumber, o.orderDate
FROM customers c
LEFT JOIN (
    SELECT customerNumber, orderNumber, orderDate
    FROM orders
) o ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber;


-- RIGHT JOIN example: list employees who are sales reps and orders associated via customers
SELECT e.employeeNumber, e.firstName, e.lastName,
       c.customerNumber, c.customerName, o.orderNumber, o.orderDate
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
RIGHT JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
ORDER BY e.employeeNumber, o.orderDate;


-- FULL OUTER JOIN emulation: all products and any matching orderdetails
SELECT p.productCode, p.productName, od.orderNumber, od.quantityOrdered
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode

UNION

SELECT p.productCode, p.productName, od.orderNumber, od.quantityOrdered
FROM products p
RIGHT JOIN orderdetails od ON p.productCode = od.productCode;


-- 3-table INNER JOIN: order lines with product and order header info
SELECT o.orderNumber, o.orderDate, od.orderLineNumber,
       od.productCode, p.productName, od.quantityOrdered,
       od.priceEach, (od.quantityOrdered * od.priceEach) AS lineTotal
FROM orders o
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
INNER JOIN products p ON od.productCode = p.productCode
WHERE o.orderNumber = 10103;  -- sample order

-- SELF JOIN: employees with their manager's name
SELECT e.employeeNumber AS emp_id, e.firstName AS emp_first, e.lastName AS emp_last,
       m.employeeNumber AS mgr_id, m.firstName AS mgr_first, m.lastName AS mgr_last
FROM employees e
LEFT JOIN employees m ON e.reportsTo = m.employeeNumber
ORDER BY e.employeeNumber;


-- CROSS JOIN: offices × productlines (limit to small result set)
SELECT o.officeCode, o.city AS office_city, pl.productLine
FROM offices o
CROSS JOIN productlines pl
LIMIT 40;


-- Aggregate: top 10 customers by total sales
SELECT c.customerNumber, c.customerName, SUM(od.quantityOrdered * od.priceEach) AS total_sales
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName
ORDER BY total_sales DESC
LIMIT 10;


-- Latest order per customer using window functions (MySQL 8+)
SELECT customerNumber, customerName, orderNumber, orderDate
FROM (
  SELECT c.customerNumber, c.customerName,
         o.orderNumber, o.orderDate,
         ROW_NUMBER() OVER (PARTITION BY c.customerNumber ORDER BY o.orderDate DESC) as rn
  FROM customers c
  LEFT JOIN orders o ON c.customerNumber = o.customerNumber
) t
WHERE rn = 1 OR rn IS NULL;


