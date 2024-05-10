select 
      sr.ID,
      sr.DENOMINAZIONE,
      sr.INDIRIZZO,
      sr.PRIVATI,
      sr.LINGUE,
      sr.SPORT,
      sr.LATITUDINE,
      sr.LONGITUDINE,
      sr.COMUNE_ID,
       c.COMUNE,
      sr.ZONA_ID,
       z.ZONA,
      sr.CLASSIFICAZIONE_ID,
       l.CLASSIFICAZIONE
 from D15_STRUTTURE_RICETTIVE sr
 left join D15_COMUNE c on sr.COMUNE_ID = c.COMUNE_ID
 left join D15_ZONA z   on sr.ZONA_ID = z.ZONA_ID
 left join D15_CLASSIFICAZIONE l   on sr.CLASSIFICAZIONE_ID = l.CLASSIFICAZIONE_ID
