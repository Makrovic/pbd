-----------------
select * from Suppliers
select * from Customers
select * from Products
select * from Categories
select * from OrderItems
-----------------
--1
select count(*) as amount from Suppliers
--2
select count(*) as amount from Suppliers where address = 'Jakarta' or address = 'Surabaya' or address = 'Yogyakarta';
--3
select address,count(*) as amount from Suppliers where address in('Jakarta', 'Surabaya','Yogyakarta') group by address having count(*)>5;
--4
select region_id,count(*) as amount from Customers group by region_id;
--5
select region_id,count(*) as amount from Customers 
where year_of_birth between 2007 and 2010 group by region_id 
having count(*)>=2 order by count(*) asc;
--6
select year_of_birth,count(*) as amount from Customers 
where name like '_a%' or name like '_u%'  group by year_of_birth 
having count(*)>1 order by year_of_birth desc;
--7
select c.description as category,count(*) as amount from Categories c join Products p 
on c.category_id = p.category_id where selling_price < 300000 and stok >= 30 
group by c.description order by count(*);
--8
select c.description as category,count(*) as amount from Categories c join Products p 
on c.category_id = p.category_id where selling_price between 150000 and 500000 and stok >= 50 
group by c.description order by count(*);
--9
select s.name as supplier,count(*) as amount from Suppliers s join Products p 
on s.supplier_id = p.supplier_id where purchasing_price >= 250000 and stok between 25 and 150
group by s.name
--10
select s.name as supplier,sum(purchasing_price) as total_biaya_pembelian,sum(selling_price) as total_penjualan
from Suppliers s join Products p on s.supplier_id = p.supplier_id 
group by s.name
--11
select min(selling_price) as min_price from Products
--12
select order_id,sum(selling_price - purchasing_price) as profit from OrderItems group by order_id
--13
