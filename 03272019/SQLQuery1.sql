select * from Products
select * from Suppliers
select * from OrderItems
select * from Categories
select * from Customers
select * from Orders

--001
select description as category,name as product,stok,selling_price from Products, Categories

--002
select c.description as category,count(*) as amount from Categories c join Products p
on p.category_id = c.category_id group by c.description

--003
select c.description as category,count(*) as amount from Categories c join Products p
on p.category_id = c.category_id group by c.description having count(*) > 5

--004
select s.name as supplier, s.phone, s.address, sum(p.stok) as total_stok
from Suppliers s join Products p 
on s.supplier_id = p.supplier_id
group by s.name,s.phone,s.address

--005
select s.name as supplier, s.phone, s.address, sum(purchasing_price * stok) as total_purchase
from Suppliers s join Products p 
on s.supplier_id = p.supplier_id
group by s.name,s.phone,s.address

--006
select c.name as customer, o.order_id, o.date
from Customers c join Orders o
on c.customer_id = o.customer_id

--007
select c.name as customer, o.order_id, o.date,oi.product_id, oi.amount, oi.selling_price, 
sum(oi.selling_price * oi.amount) as sub_total
from Customers c join Orders o
on c.customer_id = c.customer_id
join OrderItems oi
on o.order_id = oi.order_id
group by c.name,o.order_id,o.date,oi.amount,oi.product_id, oi.selling_price

--008
select c.name as customer, o.order_id, o.date,p.name as product, oi.amount, oi.selling_price, 
sum(oi.selling_price * oi.amount) as sub_total
from Customers c join Orders o
on c.customer_id = c.customer_id
join OrderItems oi
on o.order_id = oi.order_id
join Products p
on oi.product_id = p.product_id
group by c.name,o.order_id,o.date,oi.amount,oi.product_id, oi.selling_price,p.name

--009
select c.name as customer, o.order_id, o.date,ca.description as category,p.name as product, oi.amount, oi.selling_price, 
sum(oi.selling_price * oi.amount) as sub_total
from Customers c join Orders o
on c.customer_id = c.customer_id
join OrderItems oi
on o.order_id = oi.order_id
join Products p
on oi.product_id = p.product_id
join Categories ca
on p.category_id = ca.category_id
group by c.name,o.order_id,o.date,oi.amount,oi.product_id, oi.selling_price,p.name,ca.description

--010
select c.name, sum(oi.amount * oi.selling_price) as total
from Customers c join Orders o
on c.customer_id = o.customer_id
join OrderItems oi
on o.order_id = oi.order_id
group by c.name

--011
select c.name, sum(oi.amount * oi.selling_price) as total
from Customers c join Orders o
on c.customer_id = o.customer_id
join OrderItems oi
on o.order_id = oi.order_id
group by c.name
having total > (sum(oi.amount * oi.selling_price) as total
from Customers c join Orders o
on c.customer_id = o.customer_id
join OrderItems oi
on o.order_id = oi.order_id
group by c.name
having t

SELECT p.order_id, p.date, c.customer_id, c.name as customer, pi.product_id, i.name as product, pi.amount 
FROM Orders p 
JOIN Customers c 
ON p.customer_id = c.customer_id 
JOIN OrderItems pi 
ON p.order_id = pi.order_id 
JOIN Products i 
ON pi.product_id = i.product_id 
ORDER BY date DESC