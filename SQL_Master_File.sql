--MediaType 
SELECT mt.name, sum(il.Quantity) AS sales_count
FROM InvoiceLine AS il
INNER JOIN Track AS t ON il.TrackId = t.TrackId
INNER JOIN MediaType AS mt ON mt.MediaTypeId = t.MediaTypeId
GROUP BY mt.name;

--Genre
SELECT g.name, sum(il.Quantity) sales_count
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON g.GenreId = t.GenreId
GROUP BY g.name
ORDER BY sum(il.Quantity) DESC;

--Top Sales Agent
SELECT Employee.hiredate Hire_Date,Employee.firstname,
Employee.lastname LastName, COUNT(Invoice.invoiceid) Total_Sales,
ROUND(SUM(Invoice.total), 2) Value_of_Sale
FROM employee 
JOIN customer ON customer.supportrepid = employee.employeeid
JOIN invoice ON invoice.customerid = customer.customerid
WHERE title = 'Sales Support Agent' GROUP BY 1
  
--Top Customer
SELECT Customer.FirstName,Customer.LastName, Customer.Country, round(SUM(Invoice.Total)) AS Total_Amount
FROM Invoice
JOIN Customer
ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY Invoice.Total DESC
LIMIT 10
