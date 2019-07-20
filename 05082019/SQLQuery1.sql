--001
select * from Customers where customer_id = 'CUS-000001'

update Customers set name = 'Bagus Aliandro'
where customer_id = 'CUS-000001'

--karena default transaction untuk Microsoft SQL Server adalah autocommit

--002
select * from Customers where customer_id = 'CUS-000004'

begin transaction

update Customers set name = 'Paijo'
where customer_id = 'CUS-000004'

rollback transaction

--karena implicit_transaction tidak di-set
--pada line ke 6 ada perintah rollback yang artinya membatalkan transaction yang belum di-commit

--003
-- deklarasi variabel
declare @insert_err int
declare @delete_err int

begin transaction

-- tambah customer baru
insert into Customers (customer_id, name, address, region_id, year_of_birth)
values ('CUS-000016', 'Jhono', 'Yogyakarta', 'WL002', 2008)

-- simpan err number hasil dari perintah insert
set @insert_err = @@ERROR

-- hapus customer
delete from Customers where customer_id = 'CUS-000005'

-- simpan err number hasil dari perintah delete
set @delete_err = @@ERROR

if @insert_err = 0 and @delete_err = 0 -- tidak ada error
begin
	print 'transaksi berhasil'
	commit transaction
end
else
begin
	print 'transaksi gagal'
	rollback transaction
end

--penambahan customer baru dengan nama Jhono gagal dilakukan karena :
--ada salah satu perintah di dalam transaction yang error
--dan perintah itu adalah perintah delete yang disebabkan adanya kolom customer_id
--dari tabel Orders yang mereferensikan kolom customer_id pada tabel Customers
--sedangkan ada kondisi if di mana transaction akan dicommit apabila
--semua perintah tidak error

--004
