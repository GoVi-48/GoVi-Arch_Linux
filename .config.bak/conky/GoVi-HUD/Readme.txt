- Extract the file anywhere you want "tar xzvf .
- Go to the extracted directoty
- Double-click on 'start.sh' and voila

Trouble shooting :
Fonts :
	If they are not displayed correctly, copy all the fonts 
	(of the fonts directory) to :/usr/share/fonts/truetype/

Temperature :
	Please install lm-sensors and run "sensors-detect" as superuser
	
Widgets placements:
	Click on 'ALT' + mouse to move the widgets around

Automatic start:
	I personnally use a small bash script which contains ie go.sh
	#!/bin/sh
	cd AutomatiK
	./start.sh

	Then I type chmod +x go.sh, the link go.sh to software on startup
 
