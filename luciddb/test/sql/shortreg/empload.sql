CREATE foreign table csv_schema.SHORTREG_EMP_SRC (
EMPNO INTEGER,
FNAME VARCHAR(20),
LNAME VARCHAR(20),
SEX VARCHAR(1),
DEPTNO INTEGER,
MANAGER INTEGER,
LOCID VARCHAR(2),
SAL INTEGER,
COMMISSION INTEGER,
HOBBY VARCHAR(20)
)
server csv_server
options (table_name 'emp');

INSERT INTO s.EMP
SELECT EMPNO,FNAME,LNAME,SEX,DEPTNO,MANAGER,LOCID,SAL,COMMISSION,HOBBY
FROM csv_schema.SHORTREG_EMP_SRC;