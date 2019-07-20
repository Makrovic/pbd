select * from Categories
select * from Products
select * from Suppliers
select * from Customers
select * from OrderItems
select * from Orders

----------------------001
declare @address varchar(25)
declare @jumlah varchar(25)
declare @i int
set @i = 1

declare cursor_supplier cursor for
	select address, count(*)
	from Suppliers
	group by address

open cursor_supplier

fetch next from cursor_supplier into @address, @jumlah

while (@@FETCH_STATUS = 0)
begin
	print cast(@i as varchar)+'. Kota = '+@address+', Jumlah = '+@jumlah
	set @i = @i + 1

	fetch next from cursor_supplier into @address, @jumlah
end

close cursor_supplier
deallocate cursor_supplier

----------------------002
declare @name varchar(25)
declare @selling_price int
declare @i int
set @i = 1

declare cursor_products cursor for
	select name, selling_price
	from Products

open cursor_products

fetch next from cursor_products into @name, @selling_price

while (@@FETCH_STATUS = 0)
begin
	if (@selling_price > 1000000)
		print cast(@i as varchar)+'. Product = '+@name+', Harga jual = '+cast(@selling_price as varchar)
		set @i = @i + 1

	fetch next from cursor_products into @name, @selling_price
end

close cursor_products
deallocate cursor_products

----------------------003
declare @name varchar(25)
declare @selling_price int
declare @sum int
declare @i int
set @i = 1
set @sum = 0

declare cursor_products cursor for
	select name, selling_price
	from Products

open cursor_products

fetch next from cursor_products into @name, @selling_price

while (@@FETCH_STATUS = 0)
begin
	
	if (@selling_price > 1000000)
		print cast(@i as varchar)+'. Nama barang = '+@name+', Harga jual = '+cast(@selling_price as varchar)
		set @sum = @sum + @selling_price
		set @i = @i + 1

	fetch next from cursor_products into @name, @selling_price
	
end
	print '=========================================================='
	print 'Total harga jual : Rp. '+cast(@sum as varchar)

close cursor_products
deallocate cursor_products

----------------------004
declare @category varchar(25)
declare @jumlah int
declare @i int
set @i = 1

declare cursor_category cursor for
	select c.description, count(*)
	from Products p join Categories c
	on p.category_id = c.category_id
	group by c.description

open cursor_category

fetch next from cursor_category into @category, @jumlah

while (@@FETCH_STATUS = 0)
begin
	if (@jumlah > 1)
		print cast(@i as varchar)+'. '+@category
		print '--> Jumlah Produk : '+cast(@jumlah as varchar)
		set @i = @i + 1
		print ' '

	fetch next from cursor_category into @category, @jumlah
	
end

close cursor_category
deallocate cursor_category

----------------------005
declare @name varchar(25)
declare @jumlah int
declare @i int
set @i = 1

declare cursor_order cursor for
	select c.name, count(*)
	from Customers c join Orders o
	on c.customer_id = o.customer_id
	group by c.name

open cursor_order

fetch next from cursor_order into @name, @jumlah

while (@@FETCH_STATUS = 0)
begin
	if (@jumlah > 1)
		print cast(@i as varchar)+'. '+@name
		print '--> Jumlah Transaksi : '+cast(@jumlah as varchar)
		print ' '

	fetch next from cursor_order into @name, @jumlah
	
end

close cursor_order
deallocate cursor_order

