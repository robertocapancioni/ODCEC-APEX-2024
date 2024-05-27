declare
    l_collection varchar2(100) :='FATTURE_XML_COLL';
    l_zip_file      blob;
    l_unzipped_file blob;
    l_files         apex_zip.t_files;
    l_clob          clob;
begin
    select zip
        into l_zip_file
        from d20_caricamento
    where id  = :P9_ID;

    l_files := apex_zip.get_files (
            p_zipped_blob => l_zip_file );
       
    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(l_collection);
    for i in 1 .. l_files.count loop
        l_unzipped_file := apex_zip.get_file_content (
            p_zipped_blob => l_zip_file,
            p_file_name   => l_files(i) );
            l_clob := apex_util.blob_to_clob(p_blob => l_unzipped_file );
     APEX_COLLECTION.ADD_MEMBER (p_collection_name=>l_collection
                               ,p_c001 =>l_files(i) 
                               ,p_clob001 => l_clob 
                               );
    end loop;
end;