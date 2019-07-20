--1------------------------------------------
create function fn_get_volume_balok(@panjang int,@lebar int,@tinggi int)
returns int
as
begin
	declare @volume int
	set @volume = @panjang * @lebar *@tinggi
	return @volume
end

declare @panjang int
declare @lebar int
declare @tinggi int
declare @volume int

set @panjang = 2
set @lebar = 3
set @tinggi = 4

set @volume = dbo.fn_get_volume_balok(@panjang, @lebar, @tinggi)

print 'Volume balok : ' + cast(@volume as varchar)


--2------------------------------------------
create function fn_get_selisih(@bil1 int,@bil2 int)
returns int
as
begin
	declare @selisih int
	set @selisih = @bil1 - @bil2
	return @selisih
end

declare @selisih int

set @selisih = dbo.fn_get_selisih(1000, 300)

print 'Selisih : ' + cast(@selisih as varchar)


--3------------------------------------------
create function fn_get_nama_hari(@tanggal datetime)
returns varchar(7)
as
begin
	declare @hari varchar(7)
	declare @nomor_hari int

	set @nomor_hari = datepart(weekday,@tanggal)
	
	set @hari = case @nomor_hari
		when 1 then 'Minggu'
		when 2 then 'Senin'
		when 3 then 'Selasa'
		when 4 then 'Rabu'
		when 5 then 'Kamis'
		when 6 then 'Jumat'
		else 'Sabtu'
	end

	return @hari
end

declare @tanggal datetime
declare @hari varchar(7)

set @tanggal = '2019-06-25'
set @hari = dbo.fn_get_nama_hari(@tanggal)

print 'Hari : '+@hari


--4------------------------------------------
create function fn_get_nama_bulan(@tanggal datetime)
returns varchar(7)
as
begin
	declare @bulan varchar(10)
	declare @nomor_bulan int

	set @nomor_bulan = datepart(month,@tanggal)
	
	set @bulan = case @nomor_bulan
		when 1 then 'Januari'
		when 2 then 'Februari'
		when 3 then 'Maret'
		when 4 then 'April'
		when 5 then 'Mei'
		when 6 then 'Juni'
		when 7 then 'Juli'
		when 8 then 'Agustus'
		when 9 then 'September'
		when 10 then 'Oktober'
		when 11 then 'November'
		else 'Desember'
	end

	return @bulan
end

declare @tanggal datetime
declare @bulan varchar(10)

set @tanggal = '2019-06-25'
set @bulan = dbo.fn_get_nama_bulan(@tanggal)

print 'Bulan : '+@bulan


--5------------------------------------------
create function fn_get_info_hari(@tanggal datetime)
returns varchar(50)
as
begin
	declare @info_hari varchar(50)
	declare @bulan varchar(10)
	declare @hari varchar(7)

	
	set @hari = dbo.fn_get_nama_hari(@tanggal)
	set @bulan = dbo.fn_get_nama_bulan(@tanggal)
	set @info_hari = @hari+', '+cast(day(@tanggal) as varchar)
+' '+@bulan+' '+cast(year(@tanggal) as varchar)

end

declare @tanggal datetime
declare @info_hari varchar(50)

set @tanggal = '2019-06-26'
set @info_hari = dbo.fn_get_info_hari(@tanggal)

print 

--6------------------------------------------
alter function fn_hitung_profit_product(@product_id varchar(20))
returns int
as
begin
	declare @profit int

	select @profit = sum(selling_price - purchasing_price)
	from OrderItems
	where product_id = @product_id

	return @profit
end

declare @profit int
set @profit = dbo.fn_hitung_profit_product('CG-001-IT000003')

print 'Profit : '+cast(@profit as varchar)


--7------------------------------------------
create function fn_hitung_profit_product(@product_id varchar(20))
returns int
as
begin
	declare @profit int

	select @profit = sum(selling_price - purchasing_price)
	from OrderItems
	where product_id = @product_id

	return @profit
end

declare @profit int
set @profit = dbo.fn_hitung_profit_product('CG-001-IT000003')

print 'Profit : '+cast(@profit as varchar)