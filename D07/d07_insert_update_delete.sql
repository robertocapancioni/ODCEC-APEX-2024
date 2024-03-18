insert into EMP ( EMPNO
                 ,ENAME
                 ,JOB
                 ,MGR
                 ,HIREDATE
                 ,SAL
                 ,COMM
                 ,DEPTNO ) 
         values ( 8000,
                 ,'BIANCHI'
                 ,'IMPIEGATO'
                 ,7782
                 ,date'2024-18-03'
                 ,1500
                 ,null
                 ,10 ); 

insert into EMP ( EMPNO
                 ,ENAME
                 ,JOB
                 ,MGR
                 ,HIREDATE
                 ,SAL
                 ,COMM
                 ,DEPTNO ) 
         values ( 8001
                 ,'VERDI'
                 ,'IMPIEGATO'
                 ,(select EMPNO from EMP where ENAME='GALLO')
                 ,date'2024-03-18'
                 ,1500
                 ,null
                 , (select DEPTNO from DEPT where DNAME='CONTABILITÀ') );

insert into EMP ( EMPNO
                 ,ENAME
                 ,DEPTNO ) 
         values ( 8003
                 ,'CARLI'
                 ,10 ); 

update EMP
   set JOB='ANALISTA'
      ,DEPTNO=20
 where EMPNO=8003;

delete
  from EMP
 where EMPNO=8003;
