-- https://docs.oracle.com/en/database/oracle/apex/24.1/aeapi/APEX_STRING.html

select column_value from apex_string.split('452:330:164:163:380',':'); 

select /*+ cardinality (s, 2) */ s.* from apex_string.split('452:330:164:163:380',':')  s;

select /*+ cardinality (s, 20) */
       v.* 
  from d24_vendita v
  join apex_string.split('452:330:164:163:380',':')s on s.column_value = v.id;

  

