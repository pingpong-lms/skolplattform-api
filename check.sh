#!/bin/sh
# check.sh - script to validate schemas and example files.

set -e -u

validate_xml () {
	xmllint --noout --schema $1 $2
}

validate_xml betyg/r01/grades.xsd betyg/r01/grades-sample.xml
validate_xml betyg/r01/grade-documents.xsd betyg/r01/grade-documents-sample.xml
validate_xml betyg/r10/betyg.xsd betyg/r10/betyg-exempel.xml

validate_xml betygsdokument/r10/betygsdokument.xsd betygsdokument/r10/betygsdokument-exempel.xml

validate_xml styrdokument/r10/styrdokument.xsd styrdokument/r10/styrdokument-exempel.xml

validate_xml nationellaprov/r10/nationellaprov.xsd nationellaprov/r10/nationellaprov-exempel.xml
