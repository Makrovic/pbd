begin transaction

update Customers set name = 'Aulia Luthfiq'
where customer_id = 'CUS-000007'

--COMMIT TRANSACTION

--

create table ConsistencyTest(
	data SMALLINT
	CONSTRAINT uq_Data1 UNIQUE
)

insert into ConsistencyTest (data) values (1)
insert into ConsistencyTest (data) values (4)

insert into ConsistencyTest (data) values ('Hai..apa kabar')

insert into ConsistencyTest (data) values (3),(3)

select * from ConsistencyTest