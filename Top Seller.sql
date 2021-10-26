  SELECT Employee.hiredate Hire_Date,Employee.firstname,
  Employee.lastname LastName, COUNT(Invoice.invoiceid) Total_Sales,
  ROUND(SUM(Invoice.total), 2) Value_of_Sale
  FROM employee 
  JOIN customer ON customer.supportrepid = employee.employeeid
  JOIN invoice ON invoice.customerid = customer.customerid
  WHERE title = 'Sales Support Agent' GROUP BY 1