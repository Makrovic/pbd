--Latihan 1
SELECT * FROM Customers

--Latihan 2
SELECT name, address FROM Customers

--Latihan 3
SELECT * FROM Customers WHERE name ='Desi Wulandari'

--Latihan 4
SELECT customer_id, address FROM Customers WHERE name ='Ichzam Rusmana'

--Latihan 5
ALTER TABLE Suppliers add phone varchar (20)
SELECT *FROM Suppliers

--Latihan 6
UPDATE Suppliers SET phone = '082251181623' WHERE Supplier_id ='SUP-000002'
UPDATE Suppliers SET phone = '082251181323' WHERE Supplier_id ='SUP-000003'
SELECT *FROM Suppliers

--Latihan 7
SELECT * FROM Suppliers WHERE phone is not null

--Latihan 8
SELECT * FROM Suppliers WHERE phone is null

--Latihan 9
SELECT count (*) FROM Suppliers WHERE phone is not null
SELECT count (*) as jumlah FROM Suppliers WHERE phone is not null

--Latihan 10
SELECT count (*) FROM Suppliers WHERE phone is null

--Latihan 11
SELECT * FROM Suppliers WHERE address = 'Jakarta' OR address = 'Makasar'
SELECT * FROM Suppliers WHERE address IN ('Jakarta','Makasar','Jogja')

--Latihan 12
SELECT c.Description as Category, P.Name as Product, P.stok as Stok FROM Products p join Categories c on p.category_id = c.category_id order by product ASC 

--Latihan 13
SELECT c.Description as Category, P.Name as Product, P.stok as Stok FROM Products p join Categories c on p.category_id = c.category_id order by product Desc

--LAtihan 14
SELECT TOP 3 * FROM Products

--Latihan 15
SELECT TOP 5 name,stok FROM Products order by stok Desc

--Latihan 16
SELECT * FROM Products
SELECT name, selling_price FROM Products WHERE selling_price between 140000 and 150000

--Latihan 17
SELECT * FROM Products
SELECT name,stok,selling_price,category_id FROM Products WHERE product_id !='CG-002'
SELECT name,stok,selling_price,category_id FROM Products WHERE product_id not in ('CG-002')

--Latihan 18

--Latihan 19

--Latihan 20

--Latihan 21
Select * From Customers WHERE Name LIKE '%ani%'
--Latihan 22
Select * From Customers WHERE Name LIKE '__i%'




	--PERTEMUAN 2

SELECT * FROM Customers
SELECT * From Products
SELECT * From Categories
SELECT * From Suppliers

--Latihan 1
SELECT Count (*) as amount from Suppliers 

--Latihan 2
SELECT Count (*) as amount from Suppliers where address =  'Jakarta' OR address = 'surabaya' OR address = 'Yogyakarta'

--Latihan 3

SELECT address, Count (*) as amount from Suppliers where address =  'Jakarta' OR address = 'surabaya' OR address = 'Yogyakarta' group by address having count (*) >5 
SELECT address, Count (*) as amount from Suppliers where address in('Jakarta','Yogyakarta','Surabaya') group by address having count (*) >5 

--Latihan 4
SELECT * from Customers
SELECT region_id, count (*) as amount from Customers group by region_id

--Latihan 5
SELECT region_id, count (*) as amount from Customers where year_of_birth between 2007 and 2010 group by region_id having count(*)>=2 order by count (*) asc

--Latihan 6
select year_of_birth,count (*) as amount from customers where name like '_a%' or name like '_u%' group by year_of_birth having count (*)>1 order by year_of_birth desc 

--Latihan 7
select c.description  as catergory, count (*) as amount from Categories c join 
Products p on c.category_id = p.category_id where selling_price <300000 and stok >=3 
group by c. description order by count (*) 

--latiahan 8
select c.description  as catergory, count (*) as amount from Categories c join 
Products p on c.category_id = p.category_id where selling_price between 150000 and 500000 and stok >=50
group by c. description order by count (*)

--latihan 9
select s.name as supplier, count (*) as amount from suppliers s join 
Products p on s.supplier_id = p.supplier_id where purchasing_price >= 
250000 and stok between 25 and 150
group by s.name

--Latihan 10
SELECT s.name as suppler, sum (purchasing_price) as total_biaya_pembelian, sum(selling_price) as total_penjualan 
from Suppliers s join Products p on s.supplier_id = p.supplier_id
group by s.name

--Latihan 11
SELECT min (selling_price) as min_price from OrderItems

--latihaan 12



	
	--Pertemuan 3

SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Categories
select * from OrderItems
select * from Orders

--latihan 1
select name as product, stok 
from Products where stok >(select stok from Products 
where name = 'Levis Design Walet')

--Latihan 2
select name as product, stok 
from Products where category_id = (select category_id from Categories
where description = 'Health')

--Latihan 3
select product_id, name as product, purchasing_price, 
(select description as category from Categories where category_id = p.category_id) 
as category
from Products p 
where purchasing_price between 200000 and 500000 

--Latihan 4
select customer_id, name as customer
from Customers
where name in (select name from customers where name like '%B%' or name like '%K%')

--Latihan 5
select category_id, description
from Categories c
where not exists (select category_id from products where category_id = c.category_id)

--Latihan 6
select product_id, name as product
from products p
where exists (select category_id from orderItems where product_id = p.product_id)

--Latihan 7
select product_id, name as product, stok
from products p
where exists (select category_id from orderItems where product_id = p.product_id)
and stok > 25

--Latihan 8
select (select name from Products where product_id = oi.product_id) as product, amount
from orderitems oi
order by amount desc

--Latihan 9
select customer_id, name as customer
from Customers c
where not exists (select customer_id from orders where customer_id = c.customer_id)

--latihan 10
select c.name as customer, count (select customer_id from Orders where)
select * from Customers c join Orders o
on c.customer_id = o.customer_id


--Pertemuan 4
SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Categories
select * from OrderItems
select * from Orders

--Latihan 1
select c.description as category, p.name as product, p.stok, p.selling_price
from Categories c join Products p on c.category_id = p.category_id

--Latihan 2
select c.description as category, count (*) as amount from Categories c join Products p
on p.category_id = c.category_id group by c.description

--Latihan 3
select c.description as category, count (*) as amount from Categories c join Products p
on p.category_id = c.category_id group by c.description having count (*) >5

--Latihan 4
select s.name as supplier, s.phone,s.address, sum(p.stok) as total_stok
from Suppliers s join Products p
on s.supplier_id = p.supplier_id
group by s.name, s.phone, s.address

--Latihan 5
select s.name as supplier, s.phone,s.address,sum(purchasing_price * stok) as total_stok
from Suppliers s join Products p
on s.supplier_id = p.supplier_id
group by s.name, s.phone, s.address

--latihan 6
select c.name as customer, o.order_id ,o.date
from Customers c join Orders o
on c.customer_id = o.customer_id

--Latihan 7
select c.name as customer, o.order_id ,o.date,oi.amount, oi.selling_price,
sum(oi.selling_price * oi.amount) as sub_total 
from Customers c join Orders o
on c.customer_id = o.customer_id
join OrderItems oi
on o.order_id = oi.order_id
group by c.name,o.order_id, o.date,oi.amount, oi.product_id,oi.selling_price

--Latihan  8
select c.name as customer, o.order_id ,o.date,p.name as product, oi.amount, oi.selling_price,
sum(oi.selling_price * oi.amount) as sub_total 
from Customers c join Orders o
on c.customer_id = o.customer_id
join OrderItems oi
on o.order_id = oi.order_id
join Products p 
on oi.product_id = p.product_id
group by c.name,o.order_id, o.date,oi.amount, oi.product_id,oi.selling_price




--Latihan 10
select c.name ,sum(oi.amount * oi.purchasing_price) as total
from Customers c joim orders o
on c.customer_id = c.customer_id
join OrdersItem oi
on o.order_id = 





--Pertemuan 5

select * from Suppliers
select * from Orders
select * from OrderItems
select * from Customers
select * from Products
select * from Categories

--Latihan 1
SELECT ca.description as category, p.name as product, p.purchasing_price, p.selling_price
from Categories ca join Products p
on ca.category_id = p.category_id 

--Latihan 2

select s.supplier_id, s.name, p.product_id, p.name
from Suppliers s join Products p
on s.supplier_id = p.supplier_id

--latihan 3

select supplier_id, name, address
from Suppliers s
where supplier_id in (select supplier_id from Products where supplier_id = s.supplier_id)

--latihan 4
select category_id, description 
from Categories ca
where not exists (select category_id from Products where category_id = ca.category_id)

--latihan 5

select s.supplier_id, s.name as supplier, p.product_id, p.name as product 
from Suppliers s join Products p
on s.supplier_id = p.supplier_id
where not exists (select product_id from OrderItems where product_id = p.product_id)

--Latihan 6

select * from Customers c
where exists (select customer_id  from Orders where customer_id = c.customer_id and date = '2016-03-01')


--latihan 7

select s.supplier_id, s.name as supplier, p.product_id, p.name as product
from Suppliers s join Products p
on s.supplier_id = p.supplier_id
where not exists (select o.order_id from Orders o join OrderItems oi on o.order_id =oi.order_id 
where oi.product_id = p.product_id and o.date ='2016-03-07')


--Latihan 8
select * from Customers where customer_id=
(select top 1 customer_id
from Orders
group by customer_id order by count (*) desc)



--Pertemuan 8

select * from Suppliers
select * from Orders
select * from OrderItems
select * from Customers
select * from Products
select * from Categories

--Latihan 1
select * from Customers where customer_id = 'CUS-000001'

UPDATE customers SET name = 'Bagus Aliandro' 
where customer_id = 'CUS-000001'

SELECT * from Customers

--Karena Bawaan default dari SQL Server untuk transaction adalah Autocommit

--Latihan 2
select * from Customers where customer_id ='CUS-000004'

BEGIN TRANSACTION 

UPDATE Customers SET name = 'Paijo'
where customer_id = 'CUS-000004'

ROLLBACK TRANSACTION

select * from Customers

--Karena tidak ada perintah untuk menyimpan data yang telah diupdate
--dan ada perintah Rollback jika ada proses yang belum terpenuhi

--Latihan 3

--deklarasi variabel
declare @insert_err int
declare @delete_err int

begin transaction

--tambah customer baru
insert into Customers (customer_id, name, address, region_id, year_of_birth)
values ('CUS-000016', 'Jhono', 'Yogyakarata', 'WL002', 2008)

--simpan err number hasil dari perintah insert
set @insert_err = @@error

--hapus customer
delete from customers where customer_id = 'CUS-000005'

--simpan err number hasil dari perintah delete
set @delete_err = @@error

if @insert_err = 0 and @delete_err = 0 --tidak ada error
begin
	print 'transaksi berhasil'
	commit transaction
end
else
begin
	print 'transaksi gagal'
	rollback transaction
end 

--Karena pada perintah if harus kedua perintah @insert_err dan @delete_err berhasil dijalankan
--sedangakan pada perintahn diatas @delete_err tidak bisa dijalankan maka perintah update customer juga tidak bisa dijalankan. 
--karena menjadi FK pada tabel Order


--Latihan 4
BEGIN TRANSACTION

UPDATE Customers set name ='Aulia Luthfi'
where customer_id = 'CUS-000007'

--COMMIT TRANSACTION

select * from Customers
where customer_id = 'CUS-000007'

--Latihan 5

CREATE TABLE ConsistencyTest (
	data SMALLINT
	CONSTRAINT uq_data1 UNIQUE
)

Insert into ConsistencyTest (data) VALUES (1)
Insert INTO ConsistencyTest (data) VALUES (4)
--Berhasil
Insert into ConsistencyTest (data) VALUES ('Hai.. Apa kabar')
--tidak Berhasil Karena
Insert into ConsistencyTest (data) VALUES (3),(3)




--Pertemuan 9

--Latihan 1
--deklarasi var
DECLARE @nama varchar(50)
DECLARE @gaji_pokok int

--pemberian nilai variabel
SET @nama = 'Paijo'
SET @gaji_pokok = 100000

print 'Nama :' + @nama + ', Gaji Pokok : ' + cast(@gaji_pokok as varchar)

--Latihan 2
DECLARE @i int 
SET @i = 0
WHILE (@i <10)
	BEGIN 
		SET @i = @i +1
		if (@i MOD 2)  
		print cast(@i as varchar)
	end



--Latihan 3
DECLARE @a int 
SET @a = 0
while (@a <10)
	begin
		set @a =@a + 1
		if @a not in (5,8,9)
		print @a
	end

--latihan 4
DECLARE @i int 
SET @i = 0
WHILE (@i <10)
	BEGIN 
		SET @i = @i +1
		if @i = 5 CONTINUE
		else if @i = 8 CONTINUE
		else if @i = 9 CONTINUE
		print cast(@i as varchar)
	end

--Latihan 5
declare @Product1 money
declare @product money
declare @nama_barang1 varchar (50)
declare @nama_barang2 varchar (50)

set @nama_barang1 = 'Hoddie Nike E01'
set @nama_barang2 = 'Hoddie Zipper Marine'

select 




