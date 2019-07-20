select * from Products
select * from OrderItems
select * from Categories
select * from Customers

select * from Orders

--001
select name as product, stok
from Products
where stok > (select stok from Products where name = 'Levis Design Walet')

--002
select name as product, stok
from Products
where category_id = (select category_id from Categories where description = 'Health')

--003
select product_id, name as product, purchasing_price, 
(select description as category from Categories where category_id = p.category_id)
from Products p
where purchasing_price between 200000 and 500000

--004
select customer_id, name as customer
from Customers
where name in (select name from Customers where name like '%B%' or name like '%K%')

--005
select category_id, description
from Categories c
where not exists (select category_id from Products where category_id = c.category_id)

--006
select product_id, name as product
from Products p
where exists (select category_id from OrderItems where product_id = p.product_id)

--007
select product_id, name as product, stok
from Products p
where exists (select category_id from OrderItems where product_id = p.product_id)
and stok < 25 

--008
select (select name from Products where product_id = oi.product_id) as product,count(oi.product_id) as amount
from OrderItems oi
group by product
order by amount desc

--009
select customer_id, name as customer
from Customers c
where not exists (select customer_id from Orders where customer_id = c.customer_id)

--010
select c.name as customer, count(o.customer_id) as [jumlah transaksi]
from Customers c join Orders o
on c.customer_id = o.customer_id
group by c.name
order by [jumlah transaksi] desc

--