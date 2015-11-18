Styrdokument API, version 1.0
=============================
Med ett _styrdokument_ avses här antingen en individuell utvecklingsplan (IUP) eller ett åtgärdsprogram. Via detta API kan information om vilka elever som har vilka styrdokument erhållas.

När ett styrdokument lagts till eller tagits bort/avsltuats skickas informationen över om vilka styrdokument en elev har efter ändringen. En elev kan därför förekomma med tomt person-element (<person id="..." />) om inget tidigare kommunicerat styrdokument inte längre är aktivt.

Information om styrdokument
---------------------------
För varje elev erhålls följande information:

- Identifierare för eleven.
- Aktuella styrdokument:
  - åtgärdsprogram: Elementets närvaro indikerar att aktuellt åtgärdsprogram finns för personen.
  - iup: Elementets närvaro indikerar att aktuellt individuell utvecklingsplan finns för personen.

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns ett XSD-schema som definierar informationen:
- [styrdokument.xsd](styrdokument.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [styrdokument-exempel.xml](styrdokument-exempel.xml)

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första versionen.
 
