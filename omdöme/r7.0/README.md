Omdöme API, version 7.0
==============================
Via detta API kan information om omdömen satta i Elevdokumentation erhållas.

Information om omdöme
---------------------------
Varje omdöme har följande attribut: 
- assessmentId: Identifierare för omdömet.
- coursePlan: Den kursplan utifrån vilken eleven har bedömts. Någon av: 
    - `GR` 
    - `GRSAR`
- doneDate: Det tillfälle som omdömet markerades som klart.
- level: Värdet på omdömet. Något av: 
    - `-1` (omdöme saknas)
    - `0` (når ännu inte en godtagbar kunskapsnivå)
    - `1` (når en godtagbar kunskapsnivå)
    - `2` (når mer än en godtagbar kunskapsnivå)
- modifiedDate: Det tillfälle som omdömet ändrats.
- publishedDate: Det tillfälle som omdömet synliggjordes för eleven.
- schoolId: Identifierare för skolan som omdömet upprättades inom.
- studentId: Identifierare för eleven som omdömet är för.
- subjectCode: Identifierare för det ämne som omdömet avser. Se lista över giltiga [ämneskoder](https://github.com/pingpong-lms/skolplattform-api/blob/master/%C3%A4mneskoder.md).
- teacherId: Identifierare för läraren eller administratören som satte omdömet.

Schema samt exempelfil
-------------------
Bifogat till detta dokument finns det JSON-schema som definierar API:ets svar:
- [schema.json](schema.json)

Bifogat till detta dokument finns även en exempelfil på svar som API:et kan returnera:
- [example-response.json](example-response.json)

API för att erhålla uppdaterade styrdokument under ett tidsintervall
--------------------------------------------------------------------
För att erhålla information om omdömen som publicerats eller ändrats inom ett visst tidsintervall görs ett HTTP GET-anrop till följande endpoint från `localhost`:

    localhost:7026/api/assessments?from=${FROM}&tom=${TOM}

För att erhålla information om omdömen som publicerats eller ändrats inom ett visst tidsintervall tillhörande en specifik elev görs ett HTTP GET-anrop till följande endpoint från localhost:

    localhost:7026/api/assessments?from=${FROM}&to=${TOM}&studentId=${STUDENTID}

För att erhålla information om omdömen som publicerats eller ändrats inom ett visst tidsintervall tillhörande en specifik skola görs ett HTTP GET-anrop till följande endpoint från localhost:

    localhost:7026/api/assessments?from=${FROM}&to=${TOM}&schoolId=${SCHOOLID}

Formatet på `from` och `to`-parametrarna, som beskriver tidsintervallet för ändringar, är `yyyy-MM-ddTHH:mm`. Exempel: `2015-02-04T12:30`.

Formatet på `studentId` och `schoolId`-parametrarna är ett UUID. Exempel: `d2397637-ec5f-4b6e-b6e2-60f92060c8a2`.

Informationen som returneras är den nuvarande i systemet, oavsett angivet tidsintervall - tidsintervallet filtrerar vilka omdömen som exponeras, och det är alltid nuvarande information som erhålls per omdöme.

HTTP-statuskoden vid korrekt användning är `200 OK` där response body är ett JSON-objekt enligt [schema.json](schema.json).

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 7.0 Första utkast.
