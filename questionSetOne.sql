#question 1
SELECT , count(*) as Invoice
FROM Invoice 
GROUP by BillingCountry
ORDER by Invoice DESC;

#Question 2
SELECT BillingCity, sum(Total) as InvoiceTotals
FROM Invoice 
GROUP by BillingCity
ORDER by InvoiceTotals DESC
LIMIT 1;

#Q3
SELECT  FirstName as "First Name", LastName as "Last Name", sum(Invoice.Total) as TotalSpent
FROM Customer , Invoice 
WHERE Customer.CustomerId=Invoice.CustomerId
GROUP BY (Invoice.CustomerId)
ORDER BY TotalSpent desc
LIMIT 1;
