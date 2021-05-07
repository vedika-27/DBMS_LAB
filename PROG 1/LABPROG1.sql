create database insurance;
use insurance;
create table insurance.person(driver_id varchar(10),name varchar(20),address varchar(30),primary key(driver_id));
desc person;
select *from person;
truncate  person ;
select *from person;
insert into person values('1','Vedika','basavangudi');
insert into person values('2','sosun','wilson garden');
insert into person values('3','masoom','berley street');
insert into person values('4','farhana','landen ');
insert into person values('5','ellen','aradhana layout');
commit;
select *from person;
create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
desc car;
insert into car values('KA052250','Indica',1990);
insert into car values('KA031181','Lancer', 1957);
insert into car values('KA095477','Toyota', 1998);
insert into car values('KA053408','Honda' ,2008);
insert into car values('KA041702','Audi',2005);
commit;
select *from car;
create table accident(report_num int,accident_date date,location varchar(20),primary key(report_num));
desc accident;
insert into accident values(11,'2003-01-12','Mysore Road');
insert into accident values(12,'2004-02-11','Southend Circle');
insert into accident values(13,'2003-01-21','Bulltemple Road');
insert into accident values(14,'2005-03-04','Mysore Road');
insert into accident values(15,'2008-02-17','Kanakpura Road');
commit;
select *from accident;
create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id,reg_num),foreign key(driver_id) references person(driver_id),foreign key(reg_num) references car(reg_num));
desc owns;
insert into owns values('1','KA052250');
insert into owns values('2','KA053408');
insert into owns values('3','KA031181');
insert into owns values('4','KA095477');
insert into owns values('5','KA041702');
commit;
select *from owns;
create table participated(driver_id varchar(10), reg_num varchar(10),report_num int, damage_amount int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));
desc participated;
insert into participated values('1','KA052250',11,10000);
insert into participated values('2','KA053408',12,50000);
insert into participated values('3','KA031181',13,25000);
insert into participated values('4','KA095477',14,8000);
insert into participated values('5','KA041702',15,5000);
commit;
select *from participated;
update participated set damage_amount=25000 where report_num=12;
select *from participated;
insert into accident values(16,'2004-06-27','Indiranagar');
insert into accident values(17,'2008-06-29','Electronic city');
select *from accident;
select count(distinct driver_id) from participated a,accident b where a.report_num=b.report_num and b.accident_date like '2008%';
select count(accident_date) from accident where accident_date>='2008-01-01'and accident_date<='2008-12-31';
select count(model) from car where model='Honda';
select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and model='Lancer';


 

