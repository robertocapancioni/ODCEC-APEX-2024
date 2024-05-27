-- CREA ZIP
declare
    l_coll_name varchar2(100) := 'FATTURA_ELETTRONICA_COLL';
    
    l_zip blob;
begin

    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => l_coll_name);
    begin
        for var_file in (select filename, xml
                           from D20_FATTURA_ELETTRONICA_XML_VW f 
                          order by filename)
        loop
            APEX_ZIP.ADD_FILE (
                p_zipped_blob => l_zip,
                p_file_name   => var_file.filename,
                p_content     => apex_util.clob_to_blob(var_file.xml) )
                ;
        end loop;
    exception when no_data_found then
        raise_application_error(-20001, 'File non trovati!');
    end;
    APEX_ZIP.FINISH(p_zipped_blob => l_zip);
     
    APEX_COLLECTION.ADD_MEMBER(
        p_collection_name => l_coll_name,
        p_blob001            => l_zip);
 
end;
--

-- DIRAMAZIONE APPLICATION_PROCESS=download_zip_file_xml


-- Callback ajax
declare
  l_coll_name varchar2(100) := 'FATTURA_ELETTRONICA_COLL';


  l_mimetype varchar2(50) := 'application/zip';
  l_name varchar2(100) := to_char(sysdate, 'YYYY-MM-DD_hh24:mi:ss') || '_fatture_xml.zip';
  l_blob blob;
   
begin
    select blob001 into l_blob from apex_collections where collection_name = l_coll_name and seq_id = 1;
     
    sys.htp.init;
    sys.owa_util.mime_header( l_mimetype, FALSE );
    sys.htp.p('Content-length: ' || sys.dbms_lob.getlength( l_blob));
    sys.htp.p('Content-Disposition: attachment; filename="' || l_name || '"' );
    sys.htp.p('Cache-Control: max-age=3600');
    sys.owa_util.http_header_close;
    sys.wpg_docload.download_file( l_blob );
 
    apex_application.stop_apex_engine;
     
exception when apex_application.e_stop_apex_engine then
    NULL;
     
end;
--
