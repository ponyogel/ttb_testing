
-- Please write a query to display all of product name from table : Products
SELECT product_name
FROM Products;

-- Please write a query to display the id , name and ci=zen who have registered date in 2022
SELECT id, name, citizen
FROM Customers
WHERE YEAR(register_date) = 2022;

-- Please write a query to display product id ,product name ,customer full name , customer
-- ci=zen who have customer_id = '001110001'
SELECT 
    p.product_id,
    p.product_name,
    c.full_name,
    c.citizen
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.customer_id = '001110001';
