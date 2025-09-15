SS 12000 för aggregerad närvaro
===============================
PING PONG publicerar ett API för att hämta aggregerad närvaro enligt den svenska standarden SS 12000.
I skrivande stund implementeras den senaste versionen av standarden från 2022; 2.1.
Mer om standarden går att läsa här: https://www.sis.se/delta-och-paverka/tksidor/tk400499/sistk450/ss-12000/. Där finns
även OpenAPI-specifikationen. Där finns även en OpenAPI-specifikation för version 2.1 add ladda ner. Den beskrivningen
är utförd enligt DIGG:s Rest profil.

Specifikt implementeras ändpunkten `/aggregatedAttendance`. För PING PONG används ett prefix
`/o/rest/ss12000` för SS 12000 vilket gör att ändpunkten blir `/o/rest/ss12000/aggregatedAttendance`.

Autentisering
-------------
Autentisering av konsumerande tjänst sker enligt överenskommelse via klientcertifikat, där Common Name ska vara
`infratjanster.stockholmstad.se`, och det ska vara signerat av CA: `C = SE, O = Expisoft AB, CN = ExpiTrust EID CA v4`.

Begränsningar gentemot standarden
---------------------------------
Några metodiker som beskrivs i standarden är inte implementerade, av det enkla skälet att det inte behövs för de syften
som PING PONG implementerar.

Dessa parametrar är inte implementerade:

- `limit`
- `pageToken`
- `expand`
- `expandReferenceNames`
