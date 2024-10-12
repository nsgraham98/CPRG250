-- with slideshow: 09 Manipulating Data Student

-- slide 6
drop table acctmanager;
CREATE TABLE acctmanager
(amid CHAR(4),
 amfirst VARCHAR2(12)  NOT NULL,
 amlast VARCHAR2(12)  NOT NULL,
 amedate DATE DEFAULT SYSDATE,
 amsal NUMBER(8,2),
 amcomm NUMBER(7,2) DEFAULT 0,
 amearn as (amsal + amcomm),
 region CHAR(2),
  CONSTRAINT acctmanager_amid_pk PRIMARY KEY (amid),
  CONSTRAINT acctmanager_region_ck
     CHECK (region IN ('N', 'NW', 'NE', 'S', 'SE', 'SW', 'W', 'E')));
drop table acctbonus;
CREATE TABLE acctbonus
(amid CHAR(4),
 amsal NUMBER(8,2),
 region CHAR(2),
  CONSTRAINT acctbonus_amid_pk PRIMARY KEY (amid));

--slide 10 -> inserting without using column names
INSERT INTO acctmanager 
   VALUES ('T500', 'Nick', 'Taylor', '10-JAN-17', 47000.00, 0, default, 'NE');
--cant use any other value for amearn as it is virtual column
INSERT INTO acctmanager 
   VALUES ('T501', 'Sue', 'Taylor', '10-JAN-17', 47000.00, 10, 47010.00, 'NE');
-- INSERT operation disallowed on virtual columns
commit;
select * from acctmanager.

-- slide 11 -> insert using column names
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, amsal,amcomm)
   VALUES ('Mandy', 'Lopez', 'L501', '01-OCT-18', 42000.00, 10000);
Commit;
select * from acctmanager; 

-- slide 12 -> using system values (default values)
INSERT INTO acctmanager (amfirst, amlast, amid, amsal)
VALUES ('Harvey', 'Wallbanger', 'W503', 50000.00);
COMMIT;

-- slide 14
-- invalid as 'C' doesn't fit within region constraint
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, region)
   VALUES ('Sara', 'Harris', 'H504', default, 'C');
-- valid
INSERT INTO acctmanager (amfirst, amlast, amid, amedate, region)
   VALUES ('Sara', 'Harris', 'H504', default, 'SE');

-- slide 15
SELECT amid, amsal, region
FROM acctmanager;

-- slide 16 -> inserting acctmanagers into acctbonus if they have an assigned region
SELECT amid, amsal, region
FROM acctmanager;

INSERT INTO acctbonus (amid, amsal, region)
SELECT amid, amsal, region
FROM acctmanager
where region is not null;

-- slide 21 -> updating an entry in acctmanager table
select * from acctmanager;
UPDATE acctmanager
SET  amcomm=1500.00, region = 'SW'
WHERE amfirst = 'Mandy' and amlast = 'Lopez';

select * from acctmanager;
commit;

-- slide 22 -> updating all rows 
select * from acctmanager;
UPDATE acctmanager
SET  amsal=amsal * 1.04;
select * from acctmanager;
commit;


-- slide 24 -> deleting table entry
-- Need to do a nested subquery to look by Nick Taylor’s ID (T500) before we can delete it in the account bonus table.
select * from acctbonus;
-- Rem we use a subquery to determine the row to deleted 
DELETE acctbonus
WHERE AMID = 'T500';
select * from acctbonus;
commit;

-- slide 25 -> creating a savepoint
savepoint before;
select * from acctmanager;
DELETE acctmanager;
select * from acctmanager;
ROLLBACK to before;
select * from acctmanager;

-- slide 31
set linesize 132
set pagesize 66
DROP TABLE book2;
CREATE TABLE book2 as
   SELECT * FROM books;
SELECT * FROM book2;

-- slide 32
set linesize 132
set echo on
drop table book2;
CREATE TABLE BOOK2 AS SELECT * FROM BOOKS;
savepoint prices;
select * from book2;
update book2
set retail = 10
where title like 'HANDCRANK%';
update book2
set retail = 49.95
where title like 'PAINLESS%';
Select * from book2;
-- rem handcranked $10.00 and painless child rearing $49.95
savepoint categories;
update book2
set category = 'SELF HELP'
where title like 'PAINLESS%';
rem view the alter data 
Select * from book2;
rollback to categories;
-- category reset to family life
Select * from book2;
rollback to prices;
-- prices reset handcranked $25, painless $89.95
Select * from book2;

