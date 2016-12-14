#!/bin/sh
# check.sh - script to validate schemas and example files.

set -e -u

validate_xml () {
	xmllint --noout --schema $1 $2
}

for function in betyg betygsdokument styrdokument nationellaprov; do
	for version in r10 r11 r12; do
		XSD_FILE=$function/$version/${function}.xsd
		XML_FILE=$function/$version/${function}-exempel.xml
		if [ -f $XSD_FILE ]; then
			validate_xml $XSD_FILE $XML_FILE
		fi
	done
done
