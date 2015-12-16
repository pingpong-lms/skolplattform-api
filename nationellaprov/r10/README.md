Nationella prov API, version 1.0
================================
Via detta API kan information om elevers sammanvägda provresultat på nationella prov erhållas.

Information om sammanvägda provresultat
--------------------------------------
Ett sammanvägt provresultat för nationellt prov erhålls för:

1. Ett ämne och en av årskurserna 3, 6 eller 9 i grundskola.
2. En kurs i gymnasieskolan, kommunal vuxenutbildning eller svenska för invandrare.

Med _provområde_ avses här antingen kombinationen av ett ämne och årskurs i grundskolan (t.ex. Matematik åk 9) eller en kurs i gymnasiet.

Vanligast är att en elev erhåller endast ett nationellt provresultat inom ett provområde, men kan under vissa omständigheter erhålla flera.  
För att stödja detta skickar systemet ut en lista av alla sammanvägda provbetyg inom ett provområde när ett provbetyg blivit tillagt, uppdaterat eller borttaget.

För varje provområde erhålls följande information:

- Identifierare för den elev vars sammanställda provresultat ändrats.
- Provområde (grundskoleämne och årskurs i grundskolan, kurs för övriga).
- En lista av sammanvägda provresultat, som kan vara tomt om alla tidigare resultat är borttagna. Varje provresultat innehåller:
	- Betygets värde (A-F) eller information om att eleven inte deltagit eller att provresultatet tappats bort.
	- Det datum då inmatningen av provresultatet gjordes.

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns det XSD-schema som definierar informationen:
- [nationellaprov.xsd](nationellaprov.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [nationellaprov-exempel.xml](nationellaprov-exempel.xml)

API för att erhålla nationella provresultat ändrade under ett tidsintervall
---------------------------------------------------------------------------
För att erhålla information om alla elevers provområden vars nationella provresultat ändrats under ett visst tidsintervall görs ett HTTP GET-anrop till följande endpoint:

    /api/national-exams/updated?from=${FROM}&to=${TO}

Formatet på `FROM` och `TO`-parametrarna, som beskriver tidsintervallet för ändringar, är `YYYY-MM-DDThh:mm`. Exempel: `2015-02-04T12:30`.

Informationen som returneras är den nuvarande i systemet, oavsett angivet tidsintervall - tidsintervallet filtrerar vilka elever informationen tas ut för, men det är alltid nuvarande information som erhålls per elev.

HTTP-statuskoden vid korrekt användning är `200 OK` där response body är ett XML-dokument enligt [nationellaprov.xsd](nationellaprov.xsd).

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första versionen.

