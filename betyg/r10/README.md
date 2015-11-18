Betyg API, version 1.0
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
- Ifall Teckenspråk för hörande eller Moderna språk: Om ämnet är läst inom Elevens val eller Språkval.
- Identifierare för de personer som beslutat om betygsuppgiften (finns inte för externt inlagda betyg).
- Skolform för skolenheten som utfärdat betygsuppgiften.
- En flagga som berättar ifall betygsuppgiften är ett betyg eller ett betygsliknande omdöme.

XSD samt exempelfi
---------------------
Bifogat till detta dokument finns det XSD-schema som definierar informationen:
- [betyg.xsd](betyg.xsd)

Bifogat till detta dokument finns även en exempelfil på händelsedata som skulle kunna skickas ut:
- [betyg-exempel.xml](betyg-exempel.xml)

Ändringshistorik
----------------
Nedan följer en beskrivning av de ändringar som gjorts till olika versioner av detta API:
- 0.1 - Första versionen.
- 0.2 - Elementnamn ändrade till engelska. Ändring till att skicka ut alla betyg för en elev efter ändring.
- 0.3 - Information ifall betyg satts genom prövning tillagd. Information om grundläggande behörighet uppnåtts för yrkesexamen tillagd.
- 0.4 - Information om att *** beslutats för elever i gymnasiesärskolan tillagd. Stöd för betygen G och VG i gamla gymnasiesärskolans läroplan från 2002 infört. Korrekt versionsnummer av schemat i xsd-filerna. Lagt till stöd för slutbetyg (final) för ämnen inom grundskoleutbildning.
- 0.5 - Information om vilken kursgrupp/ämnesgrupp samt skolgrupp betyget satts inom.
- 0.6 - Information om betygssättande personer för betyg.
- 0.7 - Information om skolform för skolenheten som utfärdat betyget. Utökning av dokumenttyper, som även möjliggör unik identifiering av skolform för skolenhet som utfärdat betygsdokumentet.
- 0.8 - Betygsdokument ska numera innehålla utfärdande skolas identifierare. OBS: personidentifieraren har döpts om i xsd för att unvika förvirring med skolidentifieraren.
- 0.9 - Korrigering av xml-schema på grund felaktigheter i version 0.8. Bland annat avsaknad av betygsättande lärare.
- 0.10 - En lista på alla de kurser alt. ämnen som är kopplade till betyg som finns på dokumentet kommer nu skickas med. grades.xsd behålls på versionsnummer 0.9 på begäran av Volvo IT då inga ändringar skedde i den filen.
- 0.11 - Tidigare skickades bara betygsättande lärare med. Nu skickas även rektor med som beslutande person. grade-documents.xsd behålls på versionsnummer 0.10.
- 0.12 - La till 1 som betygsvärde för Grundsärskolan.
- 0.13 - La till studievägskod.
- 1.0 - Ett flertal ändringar:
	- Information om utfärdade dokument har brytits ut till ett eget API.
	- Övergång till svenska genomgående.
	- Tillägg av betygsliknande omdömen för orienteringskurser i komvux och särvux.
	- Korrigera dokumentation för att visa att terminer är av typen "HT 2015", inte "HT 8".
