Betygsdokument API, version 1.0
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

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 1.0 - Första versionen, utbrutet från Betyg API.
