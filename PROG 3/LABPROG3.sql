create database supplier;
use supplier;
CREATE TABLE suppliers (
    sid INT,
    sname VARCHAR(20),
    address VARCHAR(30),
    PRIMARY KEY (sid)
);
CREATE TABLE parts (
    pid INT,
    pname VARCHAR(20),
    color VARCHAR(10),
    PRIMARY KEY (pid)
);
CREATE TABLE catalog (
    sid INT,
    pid INT,
    cost REAL,
    PRIMARY KEY (sid , pid),
    FOREIGN KEY (sid)
        REFERENCES suppliers (sid),
    FOREIGN KEY (pid)
        REFERENCES parts (pid)
);
insert into suppliers values(1001,'RELIANCE','DELHI');
insert into suppliers values(2001,'VIMAL','BANGALORE');
insert into suppliers values(3001,'UNILEVER','MUMBAI');
insert into suppliers values(4001,'P&G','KOLKATA');
commit;
select *from suppliers;
insert into parts values(0001,'BOOK','BLUE');
insert into parts values(0002,'PENCIL','BLACK');
insert into parts values(0003,'TOOTHPASTE','RED');
insert into parts values(0004,'SHAMPOO','PINK');
insert into parts values(0005,'MOBILE','GREY');
insert into parts values(0006,'CHARGER','WHITE');
insert into parts values(0007,'BOTTLE','YELLOW');
commit;
select *from parts;
insert into catalog values(1001,0005,5000);
insert into catalog values(1001,0006,400);
insert into catalog values(2001,0001,50);
insert into catalog values(2001,0002,10);
insert into catalog values(2001,0003,70);
insert into catalog values(2001,0004,200);
insert into catalog values(3001,0001,70);
insert into catalog values(3001,0002,15);
insert into catalog values(4001,0003,70);
insert into catalog values(1001,0003,80);
commit;
select *from catalog;
select distinct p.pname from parts p,catalog c where p.pid=c.pid;
select s.sname from suppliers s,catalog c where s.sid=c.sid and c.pid=(select p.pid from parts p where p.color="RED");
select p.pname from parts p,catalog c where p.pid=c.pid and c.sid=(select s.sid from suppliers s where s.sname="VIMAL"); 
select s.sid from suppliers s,catalog c,parts p where c.pid=p.pid  group by c.pid having c.cost>avg(c.cost);
select s.sname ,p.pid from Suppliers s, Catalog c, Parts p where s.sid=c.sid and c.pid =p.pid and c.cost=(select max(ca.cost) from catalog ca where ca.pid=p.pid);