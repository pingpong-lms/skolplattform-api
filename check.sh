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
