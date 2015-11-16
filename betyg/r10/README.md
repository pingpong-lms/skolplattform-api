Betyg API, version 1.0
======================
Systemet för elevdokumentation kommer att skicka ut betygsrelaterad information vid två händelser i systemet: Vid ändrade betygsuppgifter samt vid utfärdande av vissa betygsrelaterade dokument.

Information om ändrade betygsuppgifter
--------------------------------------
När en elevs betygsuppgifter ändrats (genom att en betygsuppgift lagts till, uppdaterats eller tagits bort) skickas för denna elev en lista av fullständiga betygsuppgifter ut. En betygsuppgift är ett betyg samt betygsliknande omdömen
När betyg markerats som redo för signering skickas följande information ut:
- Identifierare för eleven som betyget berör.
- Kurskod/ämneskod där betyget satts.
- Värdet på betyget, där tillåtna värden beror på skolform:
  - Grundskolan: A/B/C/D/E/F/-
  - Gymnasieskolan: A/B/C/D/E/F/- (förutom gymnasiearbetet som enbart tillåter E/F/-)
  - Gymnasiesärskolan (nuvarande läroplan) A/B/C/D/E/*** (förutom gymnasiearbetet som enbart tillåter E/F/-)
  - Gymnasiesärskolan (föregående läroplan från 2002): VG/G/***
  - Grundsärskolan: A/B/C/D/E/1
  - SFI: A/B/C/D/E/F/-
- Datum för betygsättning.
- Information ifall betyget satts genom prövning.
- Grupp-id för den kursgrupp eller ämnesgrupp betyget satts igenom. Finns inte för externa eller omvandlade betyg.
- Grupp-id för den skolgrupp som betyget satts inom.
- Ifall grundskoleämne läst inom grundskolan: Termin (exempelvis “VT 8”).
- Ifall Moderna språk eller Modersmål: Språkkod för det lästa språket.
- Ifall Teckenspråk för hörande eller Moderna språk: Om ämnet är läst inom Elevens val eller Språkval.
- Identifierare för de personer som beslutat om betyget (finns inte för externt inlagda betyg).
- Skolform för skolenheten som utfärdat betyget

Händelse vid utfärdande av utgångsdokument
------------------------------------------
- Vid utfärdande av utgångsdokument skickas följande information ut:
- Identifierare för den elev dokumentet har utfärdats för.
- Skolenhetskod för skolenheten där dokumentet utfärdats.
- GUID for den skola som utfärdar dokumentet.
- Datum för utfärdande av dokumentet.
- Typ av utgångsdokument:
- slutbetyg för grundskola (COMPULSORY_SCHOOL_DIPLOMA): Utfärdas i grundskolan.
- slutbetyg för grundskola (COMPULSORY_SCHOOL_DIPLOMA_GY): Utfärdas i gymnasieskolan.
- slutbetyg för grundskola (COMPULSORY_SCHOOL_DIPLOMA_VUX): Utfärdas i kommunal vuxenutbildning. 
- slutbetyg för gymnasiesärskolan 2002 (FINAL_GRADES_GYSAR02): Utfärdas i gymnasiesärskolan 2002.
- examensbevis - högskoleförberedande examen för gymnasieskola (HIGHER_EDUCATION_PREPARATORY_DIPLOMA): Utfärdas i gymnasieskolan.
- examensbevis - högskoleförberedande examen för gymnasieskola (HIGHER_EDUCATION_PREPARATORY_DIPLOMA_VUX): Utfärdas i kommunal vuxenutbildning.
  - kunskapsintyg för svenska för invandrare (KNOWLEDGE_CERTIFICATE_SFI): Utfärdas i svenska för invandrare.
  - kunskapsintyg för kommunal vuxenutbildning (KNOWLEDGE_CERTIFICATE_VUX): Utfärdas i kommunal vuxenutbildning.
  - betyg för sfi (SFI_DIPLOMA): Utfärdas i svenska för invandrare.
  - studiebevis för gymnasieskolan (STUDY_CERTIFICATE): Utfärdas i gymnasieskolan.
  - gymnasiesärskolebevis för individuellt program för gymnasiesärskola 2013 (STUDY_CERTIFICATE_GYSAR_INDIVIDUAL): Utfärdas i gymnasiesärskolan 2013.
  - gymnasiesärskolebevis för nationellt program för gymnasiesärskola 2013 (STUDY_CERTIFICATE_GYSAR_NATIONAL): Utfärdas i gymnasiesärskolan 2013.
  - gymnasieintyg för gymnasieskola (UPPER_SECONDARY_CERTIFICATE): Utfärdas i gymnasieskolan.
  - gymnasieingenjörsexamen för gymnasieskola (UPPER_SECONDARY_ENGINEER_DIPLOMA): Utfärdas i gymnasieskolan.
  - examensbevis - yrkesexamen för gymnasieskola (VOCATIONAL_DIPLOMA): Utfärdas i gymnasieskolan.
  - examensbevis - yrkesexamen för gymnasieskola (VOCATIONAL_DIPLOMA_VUX): Utfärdas i kommunal vuxenutbildning.
- Ifall examensbevis - yrkesexamen: Om grundläggande behörighet har uppnåtts.
- Ifall studievägskod finns för dokumentet: Den utskrivna studievägskoden.
- En lista på alla de kurser alt. ämnen som är kopplade till betyg som finns på dokumentet

XSD samt exempelfiler
---------------------
Bifogat till detta dokument finns de två XSD-scheman som definierar informationen:
- grades.xsd - schemat för händelser när betyg anges.
- grade-documents.xsd - schemat för händelser vid utfärdande av utgångsdokument.

Bifogat till detta dokument finns även exempelfiler på händelsedata som skulle kunna skickas ut:
- grades-sample.xml - exempelfil för för händelser när betyg anges.
- grade-documents-sample.xml - exempelfil för händelser vid utfärdande av utgångsdokument.

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
- 1.0:
  - grades.xsd: Möjligheten att uttrycka betygsliknande omdömen för orienteringskurser i komvux och särvux.
  - grade-documents.xsd har uppdaterats till att använda tydligare svenska namn för dokumenttyperna.