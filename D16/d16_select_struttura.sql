

select 1 -  connect_by_isleaf status,
       level, 
       ename as title, 
       case when connect_by_isleaf = 1 
            then 'fa fa-leaf'
            else 'fa fa-folders'
       end  as icon, 
       empno as value, 
       empno as tooltip, 
       null as link 
from emp
start with mgr is null
connect by prior empno = mgr
order siblings by ename;