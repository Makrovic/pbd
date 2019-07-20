select * from nilai_responsi
select * from status_responsi

--1

insert into nilai_responsi (nim, nama, matakuliah)
values ('1659','Faisal','PBD')

--2
alter function fn_status_kelulusan_1659(@nilai char)
returns varchar(11)
as
begin
	declare @kelulusan varchar(15)
	if(@nilai = 'A' or @nilai = 'B' or @nilai = 'C')
		set @kelulusan = 'lulus'
	else
		set @kelulusan = 'tidak lulus'
	return @kelulusan
end

declare @nilai char(1)
declare @status varchar(15)
set @nilai = 'A'

set @status = dbo.fn_status_kelulusan_1659(@nilai)
print 'Status Kelulusan : ' + @status

--3
alter trigger tg_update_status_responsi_1659 ON nilai_responsi
FOR UPDATE
	AS 
		declare @nilai char(1)
		declare @status varchar(15)
		declare @nim varchar(12)
		declare @matakuliah varchar(30)
	BEGIN
		select @nilai = nilai_huruf from inserted
		select @nim = nim from inserted
		select @matakuliah = matakuliah from nilai_responsi where nim = @nim

		set @status = dbo.fn_status_kelulusan_1659(@nilai)

		if(not exists(select nim, matakuliah, status from status_responsi))
			insert into status_responsi (nim, matakuliah, status)
			values (@nim,@matakuliah,@status)
		else
			update status_responsi set status = @status where nim = @nim
		update nilai_responsi 
		set nilai_huruf = @nilai where nim = @nim
	END

update nilai_responsi set nilai_huruf = 'A'
where nim = '1659'

select * from nilai_responsi
select * from status_responsi