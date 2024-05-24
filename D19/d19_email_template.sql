begin
    apex_mail.send (
        p_from=>'sviluppo@capancioni.com',
        p_to                 => 'sviluppo@capancioni.com',
        p_template_static_id => 'P01',
        p_placeholders       => '{' ||
        '    "ORDER_NUMBER":'            || apex_json.stringify( ' ' ) ||
        '   ,"CUSTOMER_NAME":'           || apex_json.stringify( ' ' ) ||
        '   ,"ORDER_DATE":'              || apex_json.stringify( ' ' ) ||
        '   ,"SHIP_TO":'                 || apex_json.stringify( ' ' ) ||
        '   ,"SHIPPING_ADDRESS_LINE_1":' || apex_json.stringify( ' ' ) ||
        '   ,"SHIPPING_ADDRESS_LINE_2":' || apex_json.stringify( ' ' ) ||
        '   ,"ITEMS_ORDERED":'           || apex_json.stringify( ' ' ) ||
        '   ,"ORDER_TOTAL":'             || apex_json.stringify( ' ' ) ||
        '   ,"ORDER_URL":'               || apex_json.stringify( ' ' ) ||
        '   ,"MY_APPLICATION_LINK":'     || apex_json.stringify( APEX_UTIL.HOST_URL || apex_page.get_url( p_application=>:APP_ID,p_page=>2 )) ||
        '}' );
        apex_mail.push_queue();
end;