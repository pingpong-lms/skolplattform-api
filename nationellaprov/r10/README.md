Nationella prov API, version 1.0
================================
Ett sammanvägt provresultat för nationellt prov erhåls för:

1. Ett ämne och en av årskurserna 3, 6 eller 9 i grundskola.
2. En kurs i gymnasieskolan, kommunal vuxenutbildning eller svenska för invandrare.

Med _provområde_ avses därför hädanefter antingen kombinationen av ett ämne och årskurs i grundskolan (t.ex. Matematik åk 9) eller en kurs i gymnasiet.

Vanligast är att en elev erhåller endast ett nationellt provresultat inom ett provområde, men kan under vissa omständigheter erhålla flera.  
För att stödja detta skickar systemet ut en lista av alla sammanvägda provbetyg inom ett provområde när ett provbetyg blivit tillagt, uppdaterat eller borttaget.

Information om sammanvägda provresultat
--------------------------------------
För varje provområde erhålls följande information:

- Identifierare för eleven.
- Provområde (grundskoleämne och årskurs i grundskolan, kurs för övriga).
- En lista av sammanvägda provresultat, som kan vara tomt om alla tidigare resultat är borttagna. Varje provresultat innehåller:
	- Betygets värde (A-F), eller 

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns ett XSD-schema som definierar informationen:
- [nationellaprov.xsd](nationellaprov.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [nationellaprov-exempel.xml](nationellaprov-exempel.xml)

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första versionen.

