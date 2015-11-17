Styrdokument API, version 1.0
=============================
När information om styrdokument efterfrågas skickas all information för de inkluderade personernas styrdokument ut. De personer som inkluderas är de som fått minst ett styrdokument ändrat (tillägg, borttag, avslut) inom det tidsspann som efterfrågas. En person kan därför exempelvis förekomma med tomt person-element (<person id="..." />) om tidigare kommunicerade styrdokument inte längre är aktiva.

Information om styrdokument
---------------------------
För varje person visas följande information:

- Identifierare för eleven
- Aktuella styrdokument:
  - actionprogram: Elementets närvaro indikerar att aktuellt åtgärdsprogram finns för personen.
  - individualdevelopmentplan: Elementets närvaro indikerar att aktuellt individuell utvecklingsplan finns för personen.

XSD samt exempelfiler
---------------------
Bifogat till detta dokument finns ett XSD-schema som definierar informationen:
- [styrdokument.xsd](styrdokument.xsd) - schemat för hur information om styrdokument kommuniceras.

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [styrdokument-sample.xml](styrdokument-sample.xml) - exempelfil för hur information om styrdokument kommuniceras.

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första versionen.
 
