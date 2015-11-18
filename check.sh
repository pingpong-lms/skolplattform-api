#!/bin/sh
# check.sh - script to validate schemas and example files.

set -e -u

validate_xml () {
	xmllint --noout --schema $1 $2
}

for betygapiversion in r01 r10; do
	validate_xml betyg/$betygapiversion/grades.xsd betyg/$betygapiversion/grades-sample.xml
	validate_xml betyg/$betygapiversion/grade-documents.xsd betyg/$betygapiversion/grade-documents-sample.xml
done

validate_xml styrdokument/r10/styrdokument.xsd styrdokument/r10/styrdokument-sample.xml

validate_xml nationellaprov/r10/nationellaprov.xsd nationellaprov/r10/nationellaprov-exempel.xml
