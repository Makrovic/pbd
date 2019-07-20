-- ganti nilai XXXX dg 4 digit nim terakhir Anda
CREATE DATABASE DbRetail_1659;

GO

-- ganti nilai XXXX dg 4 digit nim terakhir Anda
USE DbRetail_1659;

GO

CREATE TABLE Customers(
	customer_id CHAR(10) NOT NULL,
	name VARCHAR(30) NULL,
	address VARCHAR(50) NULL,
	PRIMARY KEY (customer_id)
);

GO

CREATE TABLE Suppliers(
	supplier_id CHAR(10) NOT NULL,
	name VARCHAR(30) NULL,
	address VARCHAR(50) NULL,
	PRIMARY KEY (supplier_id)
);

GO

CREATE TABLE Categories(
	category_id CHAR(6) NOT NULL,
	description VARCHAR(50) NULL,
	PRIMARY KEY (category_id)
);

GO

CREATE TABLE Products(
	product_id CHAR(15) NOT NULL,
	name VARCHAR(50) NULL,
	stok INT NULL,
	purchasing_price MONEY NULL,
	selling_price MONEY NULL,
	category_id CHAR(6) NOT NULL 
		FOREIGN KEY REFERENCES Categories (category_id)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	supplier_id CHAR(10) NULL 
		FOREIGN KEY REFERENCES Suppliers (supplier_id)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	PRIMARY KEY (product_id)
);

GO

CREATE TABLE Orders(
	order_id CHAR(14) NOT NULL,
	customer_id CHAR(10) NOT NULL
		FOREIGN KEY REFERENCES Customers (customer_id)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	salesman_id VARCHAR(10) NOT NULL,
	date DATETIME NULL,
	PRIMARY KEY (order_id)
);

GO

CREATE TABLE OrderItems(
	order_id CHAR(14) NOT NULL
		FOREIGN KEY REFERENCES Orders (order_id)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	product_id CHAR(15) NOT NULL
		FOREIGN KEY REFERENCES Products (product_id)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	amount INT NULL,
	purchasing_price MONEY NULL,
	selling_price MONEY NULL,
	PRIMARY KEY (order_id, product_id)
);

GO

INSERT INTO Customers VALUES ('CUS-000001','Bagus Nur Hakim','Jakarta');
INSERT INTO Customers VALUES ('CUS-000002','Putri Kharisma','Yogyakarta');
INSERT INTO Customers VALUES ('CUS-000003','Aliany Milawaty','Yogyakarta');
INSERT INTO Customers VALUES ('CUS-000004','Yudha Adisaputra','Solo');
INSERT INTO Customers VALUES ('CUS-000005','Nurafni Oktaviani','Surabaya');
INSERT INTO Customers VALUES ('CUS-000006','Meilia','Bandung');
INSERT INTO Customers VALUES ('CUS-000007','Aulia Luthfi Anna','Jakarta');
INSERT INTO Customers VALUES ('CUS-000008','Ichzam Rusmana','Medan');
INSERT INTO Customers VALUES ('CUS-000009','Tri Yulianti','Makasar');
INSERT INTO Customers VALUES ('CUS-000010','Ervina Jayanti','Surabaya');
INSERT INTO Customers VALUES ('CUS-000011','Desi Wulandari','Yogyakarta');
INSERT INTO Customers VALUES ('CUS-000012','Sukma Tri Setia','Medan');
INSERT INTO Customers VALUES ('CUS-000013','Abinaya Basupati','Jakarta');
INSERT INTO Customers VALUES ('CUS-000014','Hadrian Gustin Alvaro','Jakarta');
INSERT INTO Customers VALUES ('CUS-000015','Nathania Earline','Surabaya');

GO

INSERT INTO Categories VALUES ('CG-001','Fashions & Accessories');
INSERT INTO Categories VALUES ('CG-002','Clothes');
INSERT INTO Categories VALUES ('CG-003','Beauty');
INSERT INTO Categories VALUES ('CG-004','Health');
INSERT INTO Categories VALUES ('CG-005','Household');
INSERT INTO Categories VALUES ('CG-006','Kitchen');
INSERT INTO Categories VALUES ('CG-007','Baby Care');
INSERT INTO Categories VALUES ('CG-008','Handphone & Tablet');
INSERT INTO Categories VALUES ('CG-009','Laptop & Accessories');
INSERT INTO Categories VALUES ('CG-010','Computer & Accessories');
INSERT INTO Categories VALUES ('CG-011','Electronic');
INSERT INTO Categories VALUES ('CG-012','Camera, Photo & Video');
INSERT INTO Categories VALUES ('CG-013','Otomotif');
INSERT INTO Categories VALUES ('CG-014','Sports');
INSERT INTO Categories VALUES ('CG-015','Office & Stationery');
INSERT INTO Categories VALUES ('CG-016','Souvenirs & Gifts');
INSERT INTO Categories VALUES ('CG-017','Books');
INSERT INTO Categories VALUES ('CG-018','Softwares');
INSERT INTO Categories VALUES ('CG-019','Films, Musics & Games');
INSERT INTO Categories VALUES ('CG-020','Toys & Hobbies');
INSERT INTO Categories VALUES ('CG-021','Foods & Drinks');

GO

INSERT INTO Suppliers VALUES ('SUP-000001','G&R Collection','Semarang');
INSERT INTO Suppliers VALUES ('SUP-000002','Mollersz','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000003','Tamza Accessories','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000004','Wallette','Medan');
INSERT INTO Suppliers VALUES ('SUP-000005','The Watch Gallery','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000006','Bags Collection','Medan');
INSERT INTO Suppliers VALUES ('SUP-000007','Couple9','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000008','Swag Corner','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000009','Kiss_OS','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000010','YsN','Makasar');
INSERT INTO Suppliers VALUES ('SUP-000011','Legnarose Beauty','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000012','Mutiara Cosmetics','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000013','Essential Store','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000014','Homy Collections','Medan');
INSERT INTO Suppliers VALUES ('SUP-000015','Viventi Living','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000016','Orion Bed','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000017','Tupperware ID','Makasar');
INSERT INTO Suppliers VALUES ('SUP-000018','Utama Mega','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000019','Mavely Baby','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000020','Sciabuna Store','Yogyakarta');
INSERT INTO Suppliers VALUES ('SUP-000021','Kenzie Baby','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000022','Chios CK','Yogyakarta');
INSERT INTO Suppliers VALUES ('SUP-000023','JT Shop Indo','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000024','Saga Case ID','Medan');
INSERT INTO Suppliers VALUES ('SUP-000025','Graha Baru','Surabaya');
INSERT INTO Suppliers VALUES ('SUP-000026','Parttop ID','Medan');
INSERT INTO Suppliers VALUES ('SUP-000027','Alfa Tech','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000028','King Spycam','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000029','Glories ID','Jakarta');
INSERT INTO Suppliers VALUES ('SUP-000030','Budget Gadget','Jakarta');

GO

INSERT INTO Products VALUES ('CG-001-IT000001','Snapback Hat NY',50,135000,140000,'CG-001','SUP-000001');
INSERT INTO Products VALUES ('CG-001-IT000002','Roberto Cavalli Sunglass',100,160000,165000,'CG-001','SUP-000001');
INSERT INTO Products VALUES ('CG-001-IT000003','Porsche Design Sunglass',25,265000,275000,'CG-001','SUP-000001');
INSERT INTO Products VALUES ('CG-001-IT000004','Giorgio Agneli Wallet',50,145000,150000,'CG-001','SUP-000002');
INSERT INTO Products VALUES ('CG-001-IT000005','Levis Design Walet',50,160000,175000,'CG-001','SUP-000002');
INSERT INTO Products VALUES ('CG-001-IT000006','Swarovski JAQ-001',15,243000,250000,'CG-001','SUP-000003');
INSERT INTO Products VALUES ('CG-001-IT000007','Vintage Models NCK',35,130000,135000,'CG-001','SUP-000003');
INSERT INTO Products VALUES ('CG-001-IT000008','Rossy Net Silver NCK',30,140000,150000,'CG-001','SUP-000003');
INSERT INTO Products VALUES ('CG-001-IT000009','Bohemian Blue Saphire NCK',50,240000,245000,'CG-001','SUP-000003');
INSERT INTO Products VALUES ('CG-001-IT000010','Lady Crystal NCK',25,165000,170000,'CG-001','SUP-000003');
INSERT INTO Products VALUES ('CG-002-IT000011','Black Gray Long SLeeved Shirt',100,100000,103000,'CG-002','SUP-000007');
INSERT INTO Products VALUES ('CG-002-IT000012','Hoddies Auntumn Coat',50,150000,160000,'CG-002','SUP-000007');
INSERT INTO Products VALUES ('CG-002-IT000013','Sweater Tribal Gazilo',100,90000,105000,'CG-002','SUP-000007');
INSERT INTO Products VALUES ('CG-002-IT000014','Jogger Sport Addidas',50,145000,150000,'CG-002','SUP-000008');
INSERT INTO Products VALUES ('CG-002-IT000015','Hoddie Nike E01',50,185000,190000,'CG-002','SUP-000008');
INSERT INTO Products VALUES ('CG-002-IT000016','Hoddie Zipper Marine',50,170000,175000,'CG-002','SUP-000008');
INSERT INTO Products VALUES ('CG-002-IT000017','Jadore Blouse',25,150000,159000,'CG-002','SUP-000008');
INSERT INTO Products VALUES ('CG-002-IT000018','Pieter Sweater',20,135000,140000,'CG-002','SUP-000010');
INSERT INTO Products VALUES ('CG-002-IT000019','Line Long Tunik Blouse',35,105000,120000,'CG-002','SUP-000010');
INSERT INTO Products VALUES ('CG-002-IT000020','Poland Tile Dress',50,125000,130000,'CG-002','SUP-000010');
INSERT INTO Products VALUES ('CG-003-IT000021','Babyliss Pro Curl',10,675000,689000,'CG-003','SUP-000011');
INSERT INTO Products VALUES ('CG-003-IT000022','NXY Soft Matte Lip Cream',50,125000,130000,'CG-003','SUP-000012');
INSERT INTO Products VALUES ('CG-003-IT000023','Manicure Set 777',20,195000,199000,'CG-003','SUP-000011');
INSERT INTO Products VALUES ('CG-003-IT000024','Rosemary Essential Oil',50,55000,60000,'CG-003','SUP-000013');
INSERT INTO Products VALUES ('CG-003-IT000025','Naked 3 Palette',50,235000,245000,'CG-003','SUP-000012');
INSERT INTO Products VALUES ('CG-004-IT000026','Bepathen First Aid',50,95000,100000,'CG-004','SUP-000013');
INSERT INTO Products VALUES ('CG-004-IT000027','MSI Bio Spray',50,165000,175000,'CG-004','SUP-000013');
INSERT INTO Products VALUES ('CG-004-IT000028','Medical Pro Bags',20,2000000,2090000,'CG-004','SUP-000013');
INSERT INTO Products VALUES ('CG-005-IT000029','Minimalis Sofa L',10,2000000,2100000,'CG-005','SUP-000014');
INSERT INTO Products VALUES ('CG-005-IT000030','Bellin Desk Pink',10,900000,949000,'CG-005','SUP-000014');
INSERT INTO Products VALUES ('CG-005-IT000031','Prada Prem Curtain',10,1000000,1100000,'CG-005','SUP-000015');
INSERT INTO Products VALUES ('CG-005-IT000032','Shoes Hanging',50,135000,140000,'CG-005','SUP-000015');
INSERT INTO Products VALUES ('CG-005-IT000033','Lady American Mattress Protector',50,280000,290000,'CG-005','SUP-000016');
INSERT INTO Products VALUES ('CG-005-IT000034','Waterproof Sprei Big',50,150000,155000,'CG-005','SUP-000016');
INSERT INTO Products VALUES ('CG-006-IT000035','Tupperware Blossom Series',40,545000,6320000,'CG-006','SUP-000017');
INSERT INTO Products VALUES ('CG-006-IT000036','Oxone Juicer OX-965',25,1750000,1850000,'CG-006','SUP-000014');
INSERT INTO Products VALUES ('CG-006-IT000037','Happycall Double Pan 32cm',10,1135000,1140000,'CG-006','SUP-000014');
INSERT INTO Products VALUES ('CG-006-IT000038','Vicenza Dining Set',50,439000,450000,'CG-006','SUP-000014');
INSERT INTO Products VALUES ('CG-006-IT000039','Sport Bottle 600ml',35,65000,680000,'CG-006','SUP-000017');

GO

ALTER TABLE Customers
ADD region_id VARCHAR(5);

GO

ALTER TABLE Customers
ADD year_of_birth INT;

GO

update customers set region_id='WL001', year_of_birth=2010 where customer_id='CUS-000001';
update customers set region_id='WL002', year_of_birth=2009 where customer_id='CUS-000002';
update customers set region_id='WL002', year_of_birth=2010 where customer_id='CUS-000003';
update customers set region_id='WL005', year_of_birth=2006 where customer_id='CUS-000004';
update customers set region_id='WL003', year_of_birth=2010 where customer_id='CUS-000005';
update customers set region_id='WL004', year_of_birth=2007 where customer_id='CUS-000006';
update customers set region_id='WL001', year_of_birth=2008 where customer_id='CUS-000007';
update customers set region_id='WL007', year_of_birth=2009 where customer_id='CUS-000008';
update customers set region_id='WL006', year_of_birth=2000 where customer_id='CUS-000009';
update customers set region_id='WL003', year_of_birth=2007 where customer_id='CUS-000010';
update customers set region_id='WL002', year_of_birth=2008 where customer_id='CUS-000011';
update customers set region_id='WL007', year_of_birth=2009 where customer_id='CUS-000012';
update customers set region_id='WL001', year_of_birth=2009 where customer_id='CUS-000013';
update customers set region_id='WL001', year_of_birth=2011 where customer_id='CUS-000014';
update customers set region_id='WL003', year_of_birth=2011 where customer_id='CUS-000015';


INSERT INTO Orders VALUES ('20160301-00001','CUS-000002','SLM-000001','2016-03-01');
INSERT INTO OrderItems VALUES ('20160301-00001','CG-001-IT000007',1,130000, 135000.00);
INSERT INTO OrderItems VALUES ('20160301-00001','CG-003-IT000025',1,235000.00, 245000.00);
INSERT INTO OrderItems VALUES ('20160301-00001','CG-003-IT000023',1,195000.00, 199000.00);
INSERT INTO Orders VALUES ('20160301-00002','CUS-000005','SLM-000003','2016-03-01');
INSERT INTO OrderItems VALUES ('20160301-00002','CG-005-IT000032',1,135000.00, 140000.00);
INSERT INTO Orders VALUES ('20160301-00003','CUS-000001','SLM-000001','2016-03-01');
INSERT INTO OrderItems VALUES ('20160301-00003','CG-001-IT000005',1,160000.00, 175000.00);
INSERT INTO OrderItems VALUES ('20160301-00003','CG-006-IT000039',1,65000.00, 680000.00);
INSERT INTO Orders VALUES ('20160302-00001','CUS-000004','SLM-000002','2016-03-02');
INSERT INTO OrderItems VALUES ('20160302-00001','CG-002-IT000018',1,135000.00, 140000.00);
INSERT INTO Orders VALUES ('20160302-00002','CUS-000010','SLM-000006','2016-03-02');
INSERT INTO OrderItems VALUES ('20160302-00002','CG-006-IT000038',1,439000.00, 450000.00);
INSERT INTO Orders VALUES ('20160303-00001','CUS-000007','SLM-000004','2016-03-03');
INSERT INTO OrderItems VALUES ('20160303-00001','CG-003-IT000021',1,675000.00, 689000.00);
INSERT INTO OrderItems VALUES ('20160303-00001','CG-003-IT000022',2,125000.00, 130000.00);
INSERT INTO OrderItems VALUES ('20160303-00001','CG-003-IT000024',1,55000.00, 60000.00);
INSERT INTO Orders VALUES ('20160304-00001','CUS-000003','SLM-000004','2016-03-04');
INSERT INTO OrderItems VALUES ('20160304-00001','CG-002-IT000013',1,90000.00, 105000.00);
INSERT INTO OrderItems VALUES ('20160304-00001','CG-002-IT000017',1,150000.00, 159000.00);
INSERT INTO Orders VALUES ('20160304-00002','CUS-000008','SLM-000005','2016-03-04');
INSERT INTO OrderItems VALUES ('20160304-00002','CG-001-IT000002',1,160000.00, 165000.00);
INSERT INTO Orders VALUES ('20160305-00001','CUS-000006','SLM-000009','2016-03-05');
INSERT INTO OrderItems VALUES ('20160305-00001','CG-001-IT000010',1,165000.00, 170000.00);
INSERT INTO OrderItems VALUES ('20160305-00001','CG-001-IT000008',1,140000.00, 150000.00);
INSERT INTO Orders VALUES ('20160306-00001','CUS-000009','SLM-000002','2016-03-06');
INSERT INTO OrderItems VALUES ('20160306-00001','CG-002-IT000019',2,105000.00, 120000.00);
INSERT INTO Orders VALUES ('20160306-00002','CUS-000012','SLM-000010','2016-03-06');
INSERT INTO OrderItems VALUES ('20160306-00002','CG-002-IT000017',1,150000.00, 159000.00);
INSERT INTO OrderItems VALUES ('20160306-00002','CG-002-IT000015',1,185000.00, 190000.00);
INSERT INTO Orders VALUES ('20160307-00001','CUS-000015','SLM-000007','2016-03-07');
INSERT INTO OrderItems VALUES ('20160307-00001','CG-001-IT000003',1,265000.00, 275000.00);
INSERT INTO Orders VALUES ('20160308-00001','CUS-000005','SLM-000004','2016-03-08');
INSERT INTO OrderItems VALUES ('20160308-00001','CG-002-IT000011',1,100000.00, 103000.00);
INSERT INTO OrderItems VALUES ('20160308-00001','CG-002-IT000012',1,150000.00, 160000.00);
INSERT INTO Orders VALUES ('20160308-00002','CUS-000013','SLM-000008','2016-03-08');
INSERT INTO OrderItems VALUES ('20160308-00002','CG-001-IT000004',1,145000.00, 150000.00);
INSERT INTO OrderItems VALUES ('20160308-00002','CG-002-IT000014',1,145000.00, 150000.00);
INSERT INTO Orders VALUES ('20160309-00001','CUS-000010','SLM-000010','2016-03-09');
INSERT INTO OrderItems VALUES ('20160309-00001','CG-005-IT000033',1,280000.00, 290000.00);
INSERT INTO Orders VALUES ('20160309-00002','CUS-000007','SLM-000003','2016-03-09');
INSERT INTO OrderItems VALUES ('20160309-00002','CG-006-IT000036',1,1750000.00, 1850000.00);

select * from Categories
select * from Products
select * from Suppliers
select * from Customers
select * from OrderItems
select * from Orders

---------------------------------
--==============================
--001-------------------------------
select ca.description as category, p.name as product, p.purchasing_price, p.selling_price
from Categories ca join Products p
on ca.category_id = p.category_id

--002-------------------------------
select s.supplier_id, s.name, p.product_id, p.name
from Suppliers s join Products p
on s.supplier_id = p.supplier_id

--003------------------------------
select supplier_id, name, address
from Suppliers s
where exists (select supplier_id from Products where supplier_id = s.supplier_id)

--004------------------------------
select category_id, description
from Categories ca
where not exists (select category_id from Products where category_id = ca.category_id)

--005-----------------------------
select s.supplier_id, s.name as supplier, p.product_id, p.name as product
from Suppliers s join Products p
on s.supplier_id = p.supplier_id
where not exists (select product_id from OrderItems where product_id = p.product_id)

--006-----------------------------
select *
from Customers c
where exists (select customer_id from Orders where customer_id = c.customer_id 
and date = '2016-03-01')

--007----------------------------
select s.supplier_id, s.name as supplier, p.product_id, p.name as product
from Suppliers s join Products p
on s.supplier_id = p.supplier_id
where not exists (select o.order_id from Orders o join OrderItems oi 
on o.order_id = oi.order_id where oi.product_id = p.product_id and o.date = '2016-03-07')

--008----------------------------
select *
from Customers
where customer_id = (select top 1 customer_id 
from Orders group by customer_id order by count(*) desc)-