Nationella prov API, version 1.1
================================
Via detta API kan information om elevers sammanvägda provresultat på nationella prov erhållas.

Information om sammanvägda provresultat
--------------------------------------
Ett sammanvägt provresultat för nationella prov erhålls inom:

1. Ett ämne och en av årskurserna 3, 6 eller 9 i grundskola.
2. En kurs i gymnasieskolan, kommunal vuxenutbildning eller svenska för invandrare.

Med _provområde_ avses här antingen kombinationen av ett ämne och årskurs i grundskolan (t.ex. Matematik åk 9) eller en kurs i gymnasiet.

Vanligast är att en elev erhåller endast ett nationellt provresultat inom ett provområde, men kan under vissa omständigheter erhålla flera. För att stödja detta skickar systemet ut en lista av alla provtillfällen inom ett provområde när ett provbetyg blivit tillagt, uppdaterat eller borttaget inom det området.

För varje elev med uppdaterat information inom provområdet erhålls följande information:

- Identifierare för den elev vars provresultat ändrats.
- Det datum då informationen om provresultat senast uppdaterades.
- Provområde: grundskoleämne och årskurs i grundskolan, kurs för övriga skolformer.
- En lista av provtillfällen inom provområdet, där varje provtillfälle innehåller:
- En lista av sammanvägda provresultat, som kan vara tomt om alla tidigare resultat är borttagna. Varje provresultat innehåller:
	- En markör ifall resultatet tappats bort, eller eleven avvek från provtillfället. Om så är fallet finns ingen mer information.
	- Sammanvägt provbetyg (A-F) eller information om att eleven inte deltagit, eller att provresultatet tappats bort.
	- En lista av delprovsresultat, som kan vara tomt om provområdet inte använder delprov alternativt om alla tidigare resultat är borttagna. Varje delprovresultat innehåller:
	- Betygets värde (A-F) eller information om att eleven inte deltagit, eller att delprovresultatet tappats bort

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns det XSD-schema som definierar informationen:
- [nationellaprov.xsd](nationellaprov.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [nationellaprov-exempel.xml](nationellaprov-exempel.xml)

API för att erhålla nationella provresultat ändrade under ett tidsintervall
---------------------------------------------------------------------------
För att erhålla information om alla elevers provområden vars nationella provresultat ändrats under ett visst tidsintervall görs ett HTTP GET-anrop till följande endpoint:

    /api/skolplattform/nationellaprov?from=${FROM}&tom=${TOM}

Formatet på `from` och `tom`-parametrarna, som beskriver tidsintervallet för ändringar, är `yyyy-MM-ddTHH:mm`. Exempel: `2015-02-04T12:30`.

Informationen som returneras är den nuvarande i systemet, oavsett angivet tidsintervall - tidsintervallet filtrerar vilka elever informationen tas ut för, men det är alltid nuvarande information som erhålls per elev.

HTTP-statuskoden vid korrekt användning är `200 OK` där response body är ett XML-dokument enligt [nationellaprov.xsd](nationellaprov.xsd).

Ändringshistorik
----------------
- 2016-09-21: Borttag av elementet borttag i `<provtillfälle>`.
- 2016-09-09: Tillägg av attributet skolform på `<ämnesresultat>` och `<kursresultat>`.
- 2016-09-08: Uppdatering och förbättringar av XML-schemat.
- 2016-04-01: La till "from" och "tom" attribut till betyg-elementet som visar vilket tidsintervall som använts för att skapa xml:en.
- 2016-04-27: La till "poäng" för nationella prov som använder poäng istället för betyg (A-F). La till "typ" till delprovsbetyg för att visa vilken sorts delprov det är.
- 2016-03-31: Första utkast.
