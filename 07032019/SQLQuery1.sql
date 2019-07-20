select * from Products where product_id = 'CG-001-IT000002'
select * from OrderItems
select * from Categories
select * from Customers
select * from Orders


ALTER TRIGGER tg_add_product ON Products
FOR INSERT
	AS 
		declare @nama varchar(15)
	BEGIN
		select @nama = name from inserted
		print 'Product '''+@nama+''' Berhasil ditambahkan'
	END

insert into products (product_id, name, stok, purchasing_price, selling_price, category_id, supplier_id)
values ('CG-006-IT000040', 'Sport Bottle 900ml', 15, 75000, 780000, 'CG-006', 'SUP-000017')

---------------------------------------------------------
ALTER TRIGGER tg_delete_product ON Products
FOR DELETE
	AS 
		declare @nama varchar(15)
	BEGIN
		select @nama = name from deleted
		print 'Product '''+@nama+''' Berhasil dihapus'
	END

delete from products where product_id = 'CG-006-IT000040'

-----------------------------------------------------------
CREATE TRIGGER tg_kurangi_stok ON orderitems
FOR INSERT
	AS 
		declare @product_id varchar(15)
		declare @amount int
	BEGIN
		select @product_id = product_id, @amount = amount
		from inserted
		update Products set stok = (Products.stok - @amount) where product_id = @product_id
	END

insert into orderitems (order_id, product_id, amount, purchasing_price, selling_price)
values ('20160305-00001', 'CG-001-IT000002', 9, 160000, 165000)

delete from OrderItems where order_id = '20160305-00001' and product_id = 'CG-001-IT000002'


-------------------------------------------------------------
ALTER TRIGGER tg_update_stok ON orderitems
FOR UPDATE
	AS 
		declare @product_id varchar(15)
		declare @order_id varchar(15)
		declare @amountinserted int
		declare @amount int
	BEGIN
		select @order_id = order_id from inserted
		select @amount = amount from deleted
		select @amountinserted = amount from inserted
		update Products set stok = (Products.stok + @amountinserted - @amount) where product_id = @product_id
	END

update orderitems set amount = 15
where order_id = '20160305-00001' AND product_id = 'CG-001-IT000002'

-------------------------------------------------------------------
CREATE TRIGGER tg_kurangi_stok ON orderitems
FOR delete
	AS 
		declare @product_id varchar(15)
		declare @amount int
	BEGIN
		select @product_id = product_id, @amount = amount
		from inserted
		update Products set stok = (Products.stok - @amount) where product_id = @product_id
	END


delete from orderitems
where order_id = '20160305-00001' AND product_id = 'CG-001-IT000002'