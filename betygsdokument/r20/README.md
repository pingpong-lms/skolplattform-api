Betygsdokument API, version 2.0
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

Endast det senaste utfärdade dokumentet av varje typ skickas.

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
- r20: Tog bort typerna GR_TERMINGSBETYG, GR_SLUTBETYG, GRSAR_TERMINSBETYG samt GRSAR_SLUTBETYG.
- r20: Tog bort typerna SFI_BETYG och SFI_KUNSKAPSINTYG.
- r20: La till typerna GRSÄR_SLUTBETYG, GR_TERMINSBETYG, GRSÄR_TERMINSBETYG samt VUX_SLUTBETYG_GY.
- r11: La till "from" och "tom" attribut till "betyg" elementet som visar vilka argument som skickades in för att skapa xml:en.
- r10d: Ta bort skapat datum, skicka enbart senaste utfärdade dokumentet av varje typ..
- r10c: La till så att skapat datument skickas.
- r10: La till information om hur APIet kan konsumeras.
- r10: Första versionen, utbrutet från Betyg API.
