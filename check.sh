#!/bin/sh
# check.sh - script to validate schemas and example files.

set -e -u

validate_xml () {
	xmllint --noout --schema $1 $2
}

for function in betyg betygsdokument styrdokument nationellaprov; do
	validate_xml $function/r10/${function}.xsd $function/r10/${function}-exempel.xml
	validate_xml $function/r11/${function}.xsd $function/r11/${function}-exempel.xml
done
