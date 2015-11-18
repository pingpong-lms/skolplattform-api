#!/bin/sh
# check.sh - script to validate schemas and example files.

set -e -u

validate_xml () {
	xmllint --noout --schema $1 $2
}

validate_xml betyg/r01/grades.xsd betyg/r01/grades-sample.xml
validate_xml betyg/r01/grade-documents.xsd betyg/r01/grade-documents-sample.xml

for function in betyg betygsdokument styrdokument nationellaprov; do
	validate_xml $function/r10/${function}.xsd $function/r10/${function}-exempel.xml
done
