Betyg API, version 1.1
======================
API:et skickar ut betygsrelaterad information vid ändrade betygsuppgifter.

Information om ändrade betygsuppgifter
--------------------------------------
När en elevs betygsuppgifter ändras (genom att en betygsuppgift läggs till, uppdateras eller tas bort) skickas för denna elev en lista av fullständiga betygsuppgifter ut. En betygsuppgift definieras här som antingen:

1. Ett beslutat betyg, eller
2. Ett betygsliknande omdöme för orienteringskurser i komvux eller särvux.

Vid en ändring av en eller flera betygsuppgifter skickas en lista av elevens fullständiga betygsuppgifter ut, vilket kan inkludera betygsuppgifter inte ändrade vid tillfället. Genom att listan är komplett kan konsumerande system implementera uppdateringar samt borttag genom att synkronisera in den fullständiga listan i sina system.

Varje betygsuppgift innehåller följande information:

- Identifierare för eleven som betygsuppgiften berör.
- Kurskod/ämneskod där betygsuppgiften satts.
- Värdet på betygsuppgiften, där tillåtna värden beror på skolform och kurs/ämne:
  - Grundskolan: A/B/C/D/E/F/-
  - Gymnasieskolan: A/B/C/D/E/F/- (förutom gymnasiearbetet som enbart tillåter E/F/-)
  - Gymnasiesärskolan (nuvarande läroplan) A/B/C/D/E/\*\*\*/- (förutom gymnasiearbetet som enbart tillåter E/\*\*\*/-)
  - Gymnasiesärskolan (föregående läroplan från 2002): VG/G/\*\*\*
  - Grundsärskolan: A/B/C/D/E/1
  - SFI: A/B/C/D/E/F/-
  - Komvux och särvux: A/B/C/D/E/F/- (förutom betygsliknande omdömen som enbart tillåter G/IG)
  - Yrkeshögskolan: VG/G/IG
- Datum för beslut.
- Information ifall betyget satts genom prövning.
- Grupp-id för den kursgrupp eller ämnesgrupp betygsuppgiften beslutats inom. Finns inte för externa eller omvandlade betygsuppgifter.
- Grupp-id för den skolgrupp som betygsuppgiften beslutats inom.
- Ifall grundskoleämne läst inom grundskolan: Termin (exempelvis “VT 2015”).
- Ifall Moderna språk eller Modersmål: Språkkod för det lästa språket.
- Identifierare för de personer som beslutat om betygsuppgiften (finns inte för externt inlagda betyg).
- Skolform som kursen/ämnet har lästs inom.
- En flagga som berättar ifall betygsuppgiften är ett betyg eller ett betygsliknande omdöme.

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns det XSD-schema som definierar informationen:
- [betyg.xsd](betyg.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [betyg-exempel.xml](betyg-exempel.xml)

API för att erhålla betyg ändrade under ett tidsintervall 
---------------------
För att erhålla information om alla elever vars betyg som ändrats under ett visst tidsintervall görs ett HTTP GET-anrop till följande endpoint:

	/api/skolplattform/betyg?from=${FROM}&tom=${TOM}

Format på `from` och `tom`-parametrarna, som beskriver tidsintervallet för ändringar är, `yyyy-MM-ddTHH:mm`. 

HTTP-statuskoden vid korrekt användning är `200 OK` där response body är ett XML-dokument enligt [betyg.xsd](betyg.xsd).

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 Första utkast, inga ändringar har lagts till sedan 1.0.
- 1.1 La till "from" och "tom" attribut till "betyg" elementet som visar vilka argument som skickades in för att skapa xml:en.
