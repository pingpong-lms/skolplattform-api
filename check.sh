#!/bin/sh
# check.sh - script to validate schemas and example files.

set -e -u

validate_xml () {
	xmllint --noout --schema $1 $2
}

for function in betyg betygsdokument styrdokument nationellaprov; do
	for version in $function/*; do
		XSD_FILE=$version/${function}.xsd
		XML_FILE=$version/${function}-exempel.xml
		validate_xml $XSD_FILE $XML_FILE
	done
done
