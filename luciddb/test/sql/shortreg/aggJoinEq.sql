
--
-- aggregation and joins, together
--

set schema 's';

-- joins, group by non indexed columns

select count(EMP.LNAME) from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO;

select DEPT.DNAME, min(EMP.LNAME), max(EMP.FNAME) from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO group by DEPT.DNAME order by DNAME;

SELECT min(EMP.LNAME), min(DEPT.DNAME), LOCATION.CITY, floor(avg(EMP.EMPNO))
from EMP, DEPT, LOCATION
where EMP.DEPTNO=DEPT.DEPTNO and DEPT.LOCID=LOCATION.LOCID
group by LOCATION.CITY order by CITY;

SELECT min(EMP.LNAME), DEPT.DNAME, LOCATION.CITY
from EMP, DEPT, LOCATION
where EMP.DEPTNO=DEPT.DEPTNO and DEPT.LOCID=LOCATION.LOCID
group by LOCATION.CITY, DEPT.DNAME
order by CITY, DNAME;

select count(EMP.LNAME), count(CUSTOMERS.LNAME), max(PRODUCTS.NAME), sum(SALES.PRICE)
from CUSTOMERS, SALES, PRODUCTS, EMP
where CUSTOMERS.CUSTID=SALES.CUSTID and PRODUCTS.PRODID = SALES.PRODID
and EMP.EMPNO = SALES.EMPNO
group by PRODUCTS.NAME
order by 2, 3, 1, 4;

select M.LNAME, count(R.LNAME) from EMP M, EMP R
where M.EMPNO = R.MANAGER group by M.LNAME order by 2, 1;

-- joins, group by indexed columns

select DEPT.DEPTNO, min(EMP.LNAME), max(EMP.FNAME) from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO group by DEPT.DEPTNO order by DEPTNO;

SELECT LOCATION.LOCID, min(EMP.LNAME), min(DEPT.DNAME), min(LOCATION.CITY)
from EMP, DEPT, LOCATION
where EMP.DEPTNO=DEPT.DEPTNO and DEPT.LOCID=LOCATION.LOCID
group by LOCATION.LOCID order by LOCID;

SELECT LOCATION.LOCID, DEPT.DEPTNO, min(EMP.LNAME), min(DEPT.DNAME), min(LOCATION.CITY), min(LOCATION.LOCID)
from EMP, DEPT, LOCATION
where EMP.DEPTNO=DEPT.DEPTNO and DEPT.LOCID=LOCATION.LOCID
group by LOCATION.LOCID, DEPT.DEPTNO
order by LOCID, DEPTNO;

select PRODUCTS.PRODID, count(EMP.LNAME), count(CUSTOMERS.LNAME), max(PRODUCTS.NAME), sum(SALES.PRICE)
from CUSTOMERS, SALES, PRODUCTS, EMP
where CUSTOMERS.CUSTID=SALES.CUSTID and PRODUCTS.PRODID = SALES.PRODID
and EMP.EMPNO = SALES.EMPNO
group by PRODUCTS.PRODID
order by PRODID;

select M.LNAME, count(R.LNAME) from EMP M, EMP R
where M.EMPNO = R.MANAGER group by M.LNAME order by 2, 1;