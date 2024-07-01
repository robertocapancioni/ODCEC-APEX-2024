-- documentazione apex_web_service.make_rest_request
https://docs.oracle.com/en/database/oracle/apex/24.1/aeapi/MAKE_REST_REQUEST-Function.html

select 
apex_web_service.make_rest_request(
    p_url => 'https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/',
    p_http_method => 'GET'
   ) vendita
from dual;


select * 
  from json_table(
apex_web_service.make_rest_request(
    p_url => 'https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/',
    p_http_method => 'GET'
   ),
   '$.items[*]' columns( 
                        id              number        path '$.id'
                       ,data            date          path '$.data' 
                       ,prodotto        varchar2(100) path '$.prodotto'
                       ,cliente         varchar2(100) path '$.cliente'
                       ,zona_cliente    varchar2(100) path '$.zona_cliente'
                       ,quantita        number        path '$.quantita'
                       ,importo         number        path '$.importo'
                       )
);


https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/?limit=200

https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/?offset=50

https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/?q={"Prodotto":{"$instr":"cotto"}}

https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/?q={"importo":{"$lte":100}}

https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/?q={"data":{"$lte":{"$date":"2021-03-08T23:59:59Z"}}}

https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10_vendita/?q={"importo": {"$and": [{"$gt": 100},{"$lt":300}]}}

-- documentazione filtri
https://docs.oracle.com/en/database/oracle/oracle-rest-data-services/21.4/aelig/developing-REST-applications.html#GUID-091748F8-3D14-402B-9310-25E6A9116B47







select 
apex_web_service.make_rest_request(
    p_url => 'https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita/',
    p_http_method => 'GET'
   ) vendita
from dual;


select col001, col002, col003, col004, col005, col006, col007
from table(apex_data_parser.parse
(  p_content => apex_web_service.make_rest_request_b
    ('https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita_csv/', 'GET')
  , p_file_name => 'vendita.csv'
  , p_skip_rows => 1
));


select to_number(col001) id, 
       to_date(substr(col002,1,10),'yyyy-mm-dd')data, 
       col003 prodotto, 
       col004 cliente, 
       col005 zona_cliente, 
       to_number(replace(col006,'.',','))quantita, 
       to_number(replace(col007,'.',',')) importo
from table(apex_data_parser.parse
(  p_content => apex_web_service.make_rest_request_b
    ('https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita_csv/', 'GET')
  , p_file_name => 'vendita.csv'
  , p_skip_rows => 1
));


select 
apex_web_service.make_rest_request(
    p_url => 'https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita_csv/',
    p_http_method => 'GET'
   ) vendita
from dual;



declare 
l_response clob :='';
BEGIN
        l_response := APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita/',
                                                         p_http_method => 'GET',
                                                         p_username=>'UTENTE1',
                                                         p_password=>'Prova123!');    
       htp.prn(l_response);
END;
/

select col001, col002, col003, col004, col005, col006, col007
from table(apex_data_parser.parse
(  p_content => apex_web_service.make_rest_request_b
    ('https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita_csv/', 'GET',
                                                         p_username=>'UTENTE1',
                                                         p_password=>'Prova123!')
  , p_file_name => 'vendita.csv'
  , p_skip_rows => 1
));


select * 
  from json_table(
APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://cnde8nae4maapcd-capancioni.adb.eu-zurich-1.oraclecloudapps.com/ords/cy0/d10/vendita/',
                                                         p_http_method => 'GET',
                                                         p_username=>'UTENTE1',
                                                         p_password=>'Prova123!'),
   '$.items[*]' columns( 
                        id              number        path '$.id'
                       ,data            date          path '$.data' 
                       ,prodotto        varchar2(100) path '$.prodotto'
                       ,cliente         varchar2(100) path '$.cliente'
                       ,zona_cliente    varchar2(100) path '$.zona_cliente'
                       ,quantita        number        path '$.quantita'
                       ,importo         number        path '$.importo'
                       )
);