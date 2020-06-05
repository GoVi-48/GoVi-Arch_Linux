#!/usr/bin/python
import datetime
import locale
import string


#j= datetime.datetime.now().day

#print j


#num = 12345
#num_list = list(str(j))

#print num_list

#now = datetime.datetime.now()

dt = datetime.datetime.now()

#locale.setlocale(locale.LC_ALL, "en_GB.utf8")
#print(dt.strftime("%A, %d. %B %Y %I:%M%p"))
#'Tuesday, 15. November 2015 04:30pm'

#locale.setlocale(locale.LC_ALL, "fr_FR.utf8")
#print(dt.strftime("%A, %d. %B %Y %I:%M%p"))
#'tirsdag, 15. november 2015 04:30'
#locale.setlocale(locale.LC_ALL, "en_GB.utf8")



#Year=list(str(dt.strftime("%Y")))
Day=list(str(dt.strftime("%d")))
WeekDay=list(str(dt.strftime("%A")).lower())
Month=list(str(dt.strftime("%B")).lower())
Year=list(str(dt.strftime("%Y")).lower())
print WeekDay
List = []
StartingPositionDay=40
for w in WeekDay:
	LettersWeekDay="""${image img/"""+w+""".png -p """+str(StartingPositionDay)+""",50 -s 15x15}#"""+"\n"
	StartingPositionDay=StartingPositionDay+15
	List.append(LettersWeekDay)


StartingPostionWeekDay=40
for d in Day:
	LettersDay="""${image img/"""+d+""".png -p """+str(StartingPostionWeekDay)+""",70 -s 40x40}#"""+"\n"
	StartingPostionWeekDay=StartingPostionWeekDay+40
	List.append(LettersDay)


StartingPositionMonth=20
for m in Month:
	LettersMonth="""${image img/"""+m+""".png -p """+str(StartingPositionMonth)+""",90 -s 15x15}#"""+"\n"
	StartingPositionMonth=StartingPositionMonth+15
	List.append(LettersMonth)

StartingPositionYear=70
for y in Year:
	LettersYear="""${image img/"""+y+""".png -p """+str(StartingPositionMonth)+""",90 -s 15x15}#"""+"\n"
	StartingPositionYear=StartingPositionYear+15
	List.append(LettersYear)

TotalDate=''.join(List)

print TotalDate


