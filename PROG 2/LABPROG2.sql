create database bankingenterprises;
use bankingenterprises;
CREATE TABLE branch (
    branch_name VARCHAR(20),
    branch_city VARCHAR(15),
    assets REAL,
    PRIMARY KEY (branch_name)
);
desc branch;
CREATE TABLE bankaccount (
    accno INT,
    branch_name VARCHAR(20),
    balance REAL,
    PRIMARY KEY (accno),
    FOREIGN KEY (branch_name)
        REFERENCES branch (branch_name)
);
desc bankaccount;
CREATE TABLE bankcustomer (
    customer_name VARCHAR(20),
    customer_street VARCHAR(20),
    customer_city VARCHAR(15),
    PRIMARY KEY (customer_name)
);
desc bankcustomer;
CREATE TABLE depositer (
    accno INT,
    customer_name VARCHAR(20),
    PRIMARY KEY (accno , customer_name),
    FOREIGN KEY (customer_name)
        REFERENCES bankcustomer (customer_name),
    FOREIGN KEY (accno)
        REFERENCES bankaccount (accno)
);
desc depositer;
CREATE TABLE loan (
    loan_no INT,
    branch_name VARCHAR(20),
    amount REAL,
    PRIMARY KEY (loan_no),
    FOREIGN KEY (branch_name)
        REFERENCES branch (branch_name)
);
desc loan;
insert into branch values('SBI_CHAMRAJPET','BANGALORE',50000);
insert into branch values('SBI_RESIDENCYROAD','BANGALORE', 10000);
insert into branch values('SBI_SHIVAJIRAOD','BOMBAY', 20000);
insert into branch values('SBI_PARLIAMENTROAD','DELHI' ,10000);
insert into branch values('SBI_JANTARMANTAR','DELHI',20000);
commit;
select *from branch;
insert into bankaccount values(1,'SBI_CHAMRAJPET',2000);
insert into bankaccount values(2,'SBI_RESIDENCYROAD',4000);
insert into bankaccount values(3,'SBI_CHAMRAJPET',6000);
insert into bankaccount values(4,'SBI_PARLIAMENTROAD',8000);
insert into bankaccount values(5,'SBI_SHIVAJIRAOD',2000);
insert into bankaccount values(6,'SBI_JANTARMANTAR',4000);
insert into bankaccount values(7,'SBI_PARLIAMENTROAD',6000);
insert into bankaccount values(8,'SBI_SHIVAJIRAOD',8000);
insert into bankaccount values(9,'SBI_SHIVAJIRAOD',2000);
insert into bankaccount values(10,'SBI_RESIDENCYROAD',4000);
commit;
select *from bankaccount;
insert into bankcustomer values('AVINASH','BULLTEMPLE ROAD','BANGALORE');
insert into bankcustomer values('DINESH','BANNERGHATA RAOD','BANGALORE');
insert into bankcustomer values('MOHAN','SAFDARJUNG ROAD','DELHI');
insert into bankcustomer values('NIKHIL','AKBAR ROAD','DELHI');
insert into bankcustomer values('RAVI','MYSORE ROAD','BANGALORE');
commit;
select *from bankcustomer;
insert into depositer values(1,'AVINASH');
insert into depositer values(4,'MOHAN');
insert into depositer values(3,'AVINASH');
insert into depositer values(2,'DINESH');
insert into depositer values(7,'MOHAN');
insert into depositer values(2,'RAVI');
insert into depositer values(6,'NIKHIL');
insert into depositer values(10,'DINESH');
commit;
select *from depositer;
insert into loan values(1,'SBI_CHAMRAJPET',10000);
insert into loan values(2,'SBI_RESIDENCYROAD',20000);
insert into loan values(3,'SBI_SHIVAJIRAOD',30000);
insert into loan values(4,'SBI_PARLIAMENTROAD',40000);
insert into loan values(5,'SBI_JANTARMANTAR',50000);
commit;
select *from loan;
select c.customer_name
from bankcustomer c
where exists(
select d.customer_name
from depositer d, bankaccount ba
where
d.accno=ba.accno and
c.customer_name=d.customer_name and
ba.branch_name='SBI_RESIDENCYROAD'
group by d.customer_name
having count(d.customer_name)>=2
);

 SELECT DISTINCT
    d.customer_name
FROM
    depositer d
WHERE
    EXISTS( SELECT 
            *
        FROM
            bankaccount ba
        WHERE
            ba.accno = d.accno
                AND EXISTS( SELECT *
                FROM
                    branch b
                WHERE
                    b.branch_name = ba.branch_name
                        AND b.branch_city = 'Delhi'));
                        
DELETE FROM bankaccount 
WHERE
    branch_name IN (SELECT 
        branch_name
    FROM
        branch
    
    WHERE
        branch_city = 'Bombay');
SELECT * FROM BANKACCOUNT
