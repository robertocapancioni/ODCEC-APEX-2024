
tariffa /unique tariffa
  tariffa vc20 /nn 
  tariffa_oraria num /nn

persona /unique persona
  persona vc30 /nn 
  email vc50 /nn

persona_tariffa /unique persona_id,data_fine
  persona id /nn
  tariffa id /nn
  data_inizio d /nn
  data_fine  d
# settings = {"drop":true,"prefix":"d27"}
