select "ID",
       "NOME",
       sys.dbms_lob.getlength("FOTO")"FOTO",
       "FOTO_FILENAME",
       "FOTO_MIMETYPE",
       "FOTO_CHARSET",
       "FOTO_LASTUPD"
  from "D07_PERSONA"
