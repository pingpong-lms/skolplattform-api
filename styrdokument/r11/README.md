Styrdokument API, version 1.1
=============================
Med _styrdokument_ avses här följande dokument:

- Individuella utvecklingsplaner (IUP)
- Samtalsunderlag inför utvecklingssamtal.
- Åtgärdsprogram.

Aktuella skolformer är Förskoleklass, Grundskola, Grundsärskola, Gymnasieskola, Gymnasiesärskola samt Kommunal vuxenutbildning.

Via detta API kan information om vilka elever som har vilka styrdokument erhållas.

Information om styrdokument
---------------------------
För varje elev erhålls en lista av dokument där varje dokument har följande attribut:

- typ: Typ av dokument: `iup`, `samtalsunderlag` eller `åtgärdsprogram`.
- skapat: Det datum då dokumentet synliggjorts för elev och vårdnadshavare.
- avslutat: Det datum då dokumentet inte längre anses vara gällande. Behöver inte finnas för aktiva dokument.
- skola: Den skola där dokumentet upprättats.
- skolform: Den skolform dokumentet upprättades inom.
- namn: Beskrivande namn på dokumentet.

Det är den fullständiga listan av dokument som erhålls, vilket innebär att ett borttaget dokument (ej att förväxla med ett avslutat dokument) indikeras genom dess frånvaro i listan.

XSD samt exempelfil
-------------------
Bifogat till detta dokument finns det XSD-schema som definierar informationen:
- [styrdokument.xsd](styrdokument.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [styrdokument-exempel.xml](styrdokument-exempel.xml)

API för att erhålla uppdaterade styrdokument under ett tidsintervall
--------------------------------------------------------------------
För att erhålla information om alla elever vars styrdokument lagts till, avslutats eller tagits bort under ett visst tidsintervall görs ett HTTP GET-anrop till följande endpoint:

    /api/skolplattform/styrdokument?from=${FROM}&tom=${TOM}

Formatet på `from` och `tom`-parametrarna, som beskriver tidsintervallet för ändringar, är `yyyy-MM-ddTHH:mm`. Exempel: `2015-02-04T12:30`.

Informationen som returneras är den nuvarande i systemet, oavsett angivet tidsintervall - tidsintervallet filtrerar vilka elever informationen tas ut för, men det är alltid nuvarande information som erhålls per elev. Det är den fullständiga listan av dokument som erhålls, vilket innebär att ett borttaget dokument (ej att förväxla med ett avslutat dokument) indikeras genom dess frånvaro i listan.

HTTP-statuskoden vid korrekt användning är `200 OK` där response body är ett XML-dokument enligt [styrdokument.xsd](styrdokument.xsd) - notera att &lt;styrdokument&gt;-elementet kan vara tomt ifall ingen elevs styrdokument blivit uppdaterade under det angivna intervallet.

Länk till dokument
------------------
En länk till dokument av en viss typ erhålls genom URL:en

    /link/steering-document?student=...&documentType=...&school=...

där `student`-parametern är elevens id (sourcedid/id), `documentType`-parametern är dokumenttypen och `school` den skola som ska länkas in i.

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första utkast, inga ändringar har lagts till sedan StyrdokumentAPI 1.0 
