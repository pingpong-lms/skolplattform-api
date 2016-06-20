Betygsdokument API, version 1.1
===============================
API:et skickar ut information vid utfärdande av vissa betygsrelaterade dokument.

Information om utfärdat betygsdokument
--------------------------------------
Vid utfärdande av betygsdokument skickas följande information ut:

- Identifierare för den elev dokumentet har utfärdats för.
- Skolenhetskod för skolenheten där dokumentet utfärdats.
- GUID for den skola som utfärdar dokumentet.
- Datum för utfärdande av dokumentet.
- Typ av utgångsdokument (se dokumentation i XSD schemat).
- Ifall examensbevis - yrkesexamen: Om grundläggande behörighet har uppnåtts.
- Ifall studievägskod finns för dokumentet: Den utskrivna studievägskoden.
- En lista på alla de kurser alt. ämnen som är kopplade till betyg som finns på dokumentet.

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns det XSD-schema som definierar informationen:
- [betygsdokument.xsd](betygsdokument.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [betygsdokument-exempel.xml](betygsdokument-exempel.xml)

API för att erhålla betygsdokument ändrade under ett tidsintervall
------------------
För att erhålla information om alla elever vars betyg / betygsdokument som ändrats under ett visst tidsintervall görs ett HTTP GET-anrop till följande endpoint:

	/api/skolplattform/betygsdokument?from=${FROM}&tom=${TOM}

Format på `from` och `tom`-parametrarna, som beskriver tidsintervallet för ändringar är, `yyyy-MM-ddTHH:mm`. 

HTTP-statuskoden vid korrekt användning är `200 OK` där response body är ett XML-dokument enligt [betygsdokument.xsd](betygsdokument.xsd).

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första utkast, inga ändringar har lagst till sedan BetygsdokumentsAPI 1.0
- 1.1 La till "from" och "tom" attribut till "betyg" elementet som visar vilka argument som skickades in för att skapa xml:en
- 1.2 La till så att skapa datum skickas
