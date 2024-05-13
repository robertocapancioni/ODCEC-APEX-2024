create or replace view d16_persona_vw as
select * from json_table(APEX_WEB_SERVICE.MAKE_REST_REQUEST(p_url => 'https://avatars.tzador.com/faces',p_http_method => 'GET'),
 '$[*]' columns( 
                id         path '$.id',
                name       path '$.name',
                username   path '$.username',
                email       path '$.email',
                gender      path '$.gender',
                age         path '$.age',
                ethnicity   path '$.ethnicity',
                image       path '$.image'
               )
 )
