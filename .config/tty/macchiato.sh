#!/usr/bin/env bash

if [ "$TERM" = "linux" ]; then
	printf %b '\e]P024273A' # set background color to "Base"
	printf %b '\e]P85B6078' # set bright black to "Surface2"

	printf %b '\e]P7CAD3F5' # set text color to "Text"
	printf %b '\e]PFA5ADCB' # set bright white to "Subtext0"

	printf %b '\e]P1ED8796' # set red to "Red"
	printf %b '\e]P9ED8796' # set bright red to "Red"

	printf %b '\e]P2A6DA95' # set green to "Green"
	printf %b '\e]PAA6DA95' # set bright green to "Green"

	printf %b '\e]P3EED49f' # set yellow to "Yellow"
	printf %b '\e]PBEED49f' # set bright yellow to "Yellow"

	printf %b '\e]P48AADF4' # set blue to "Blue"
	printf %b '\e]PC8AADF4' # set bright blue to "Blue"

	printf %b '\e]P5F5BDE6' # set magenta to "Pink"
	printf %b '\e]PDF5BDE6' # set bright magenta to "Pink"

	printf %b '\e]P68BD5CA' # set cyan to "Teal"
	printf %b '\e]PE8BD5CA' # set bright cyan to "Teal"

	clear
fi
