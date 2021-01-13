#!/usr/bin/env python
import time, calendar, re

# credits to :
# http://www.kittykatt.us/index.php?page=scripts&s=conkycal

localtime = time.localtime(time.time())
calendar.setfirstweekday(calendar.MONDAY)
cal = calendar.month(localtime[0], localtime[1])
 
parts = cal.split('\n')

parts[0]="${color white}${font monofur:size=12:bold}"+parts[0]+"${color white}${font monofur:size=11}" #Month in White
parts[1]="${color blue}${font monofur:size=11:bold}"+parts[1]+"${color white}${font monofur:size=11}" #Weekday in blue

cal = '${offset 10}' + '\n${offset 15}'.join(parts) 
 
regex = '(?<= )%s(?= )|(?<=\n)%s(?= )|(?<= )%s(?=\n)' % (localtime[2], localtime[2], localtime[2])
replace = '${color red}${font monofur:size=11:weight=bold}%s${font monofur:size=11}${color white}' % localtime[2]
newCal = re.sub(regex, replace, cal)
print newCal
