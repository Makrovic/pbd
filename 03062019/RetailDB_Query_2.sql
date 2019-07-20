--latihan
--1
select * from Customers
--2
select name,address from Customers
--3
select * from Customers where name = 'Desi Wulandari'
--4
select customer_id,address from Customers where name = 'Ichzam Rusmana'
--5
alter table Suppliers add phone varchar(20)
--6
update Suppliers set phone = '085221662075' where supplier_id = 'SUP-000002'
update Suppliers set phone = '089638115484' where supplier_id = 'SUP-000003'
--7
select * from Suppliers where phone is not null
--8
select * from Suppliers where phone is null
--9
select count(*) from Suppliers where phone is not null
select count(*) as [jumlah] from Suppliers where phone is not null
--10
select count(*) as [jumlah] from Suppliers where phone is null
--11
select * from Suppliers where address = 'Jakarta' or address = 'Makasar'
--12
select * from Products
select * from Categories
select c.description as [category],p.name as [product], p.stok from Products p join Categories c on p.category_id = c.category_id order by product asc
--13
select c.description as [category],p.name as [product], p.stok from Products p join Categories c on p.category_id = c.category_id order by product desc
--14
select top 3 * from products
--15
select top 5 name,stok from products order by stok desc
--16
select name, selling_price from products where selling_price between 140000 and 150000
--17
select name,stok,selling_price,category_id from products where category_id != 'CG-002'