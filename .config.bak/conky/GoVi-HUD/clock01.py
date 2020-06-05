# -*- encoding: utf-8 -*-
import datetime
import locale
import string
import os


import unicodedata

header = open('header.py', 'r').read()
from translations import *
# - code from Fabien HENON
# - 12 March 2017
# please credits

# determine installed language
Language_installed=os.popen("locale | grep LANG").read()
if "fr" in Language_installed:
	Language="French"
elif "de" in Language_installed:
	Language="German"
elif "pt" in Language_installed:
	Language="Portuguese"
elif "it" in Language_installed:
	Language="Italian"
elif "jp" in Language_installed:
	Language="Italian"
else:
	Language="English"

# search for locale
os.system('export LC_ALL=C')
locale.setlocale(locale.LC_TIME, locale=locale.getdefaultlocale())

# search for current date
dt = datetime.datetime.now()

#------------------------------
#--------- Day ----------------
#------------------------------
Day=list(str(dt.strftime("%d")))


#------------------------------
#--------- Month ---------------
#------------------------------
Month=str(dt.strftime("%B")).lower()

# remove the accents from Months
try:	# python 2.7
	s1 = unicode(Month,'utf-8')
	Month = unicodedata.normalize('NFD', s1).encode('ascii', 'ignore')     
except:
	pass

try:	# python 3 and above
	Month = ''.join((c for c in unicodedata.normalize('NFD', Month) if unicodedata.category(c) != 'Mn'))
except:
	pass

Month=list(str(Month).lower())

#------------------------------
#--------- WeekDay ------------
#------------------------------
WeekDay=str(dt.strftime("%A")).lower()
# remove the accents from Weekdays
try:	# python 2.7
	s1 = unicode(WeekDay,'utf-8')
	WeekDay = unicodedata.normalize('NFD', s1).encode('ascii', 'ignore')     
except:
	pass

try:	# python 3 and above
	WeekDay = ''.join((c for c in unicodedata.normalize('NFD', WeekDay) if unicodedata.category(c) != 'Mn'))
except:
	pass


WeekDay=list(str(WeekDay).lower())

#------------------------------
#--------- Year ---------------
#------------------------------
Year=list(str(dt.strftime("%Y")).lower())


# if weekday is too long -> truncate
if len(WeekDay)>8:
	WeekDay=WeekDay[:8]

# if weekday is too short -> add empty blocks
if len(WeekDay)<8:
	for i in range(len(WeekDay),8):
		WeekDay.append("_")

# if Month is too long -> truncate
if len(Month)>5:
	Month=Month[:5]

# if Month is too short -> add empty blocks
if len(Month)<5:
	for i in range(len(Month),5):
		Month.append("_")



List = []
StartingPositionDay=10

for w in WeekDay:
	if w=="_":
		w="empty"
	LettersWeekDay="""${image img/"""+w+""".png -p """+str(StartingPositionDay)+""",50 -s 19x19}#"""+"\n"
	StartingPositionDay=StartingPositionDay+19
	List.append(LettersWeekDay)


StartingPostionWeekDay=25
for d in Day:
	LettersDay="""${image img/"""+d+""".png -p """+str(StartingPostionWeekDay)+""",75 -s 60x60}#"""+"\n"
	StartingPostionWeekDay=StartingPostionWeekDay+60
	List.append(LettersDay)


StartingPositionMonth=10
for m in Month:
	if m=="_":
		m="empty"
	LettersMonth="""${image img/"""+m+""".png -p """+str(StartingPositionMonth)+""",140 -s 15x15}#"""+"\n"
	StartingPositionMonth=StartingPositionMonth+15
	List.append(LettersMonth)

StartingPositionYear=100
for y in Year:
	LettersYear="""${image img/"""+y+""".png -p """+str(StartingPositionYear)+""",140 -s 15x15}#"""+"\n"
	StartingPositionYear=StartingPositionYear+15
	List.append(LettersYear)

TotalDate=''.join(List)

txt01="""
#==============================================================================
#                               conkyrc_orange
#
#  author  : SLK
#  version : v2011011601
#  license : Distributed under the terms of GNU GPL version 2 or later
#
#==============================================================================



gap_x 15
gap_y 160

alignment top_right
update_interval 1
lua_load clock.lua
lua_draw_hook_post main

color1 white #Month color
color2 white #Year  color
color3 white #Weekdays color
color4 FFE3A0 #Current weekday color
color5 white  #Days of month color
color6 ff0000 #Current day color
double_buffer true


TEXT
${image img/calendar_clock.png -p 0,0 -s 30x30}#
#${image img/calendar.png -p 10,40 -s 140x120}
${image img/flip_background.png -p 5,40 -s 160x130}
#${image img/background.png -p 5,70 -s 160x100}
${offset 35}${font Good Times:size=12}${color Tan1}"""+Time_Date[Language]+""" ${color}${hr 2}${font}

#${goto 20}${voffset 0}${color}${font Rounded Elegance:size=14:weight=bold}${time %B}#
#${alignr 180}${font Rounded Elegance:size=9:weight=normal}${time %Y}
#${voffset 10}${alignc 80}${color 000000}${font Rounded Elegance:size=14}${time %A}
#${alignc 80}${color FF0000}${font Rounded Elegance:size=45:weight=bold}${time %d}${font Rounded Elegance:size=10:weight=normal}

${voffset 0}
${font Liquid Crystal:size=25}${color FF0000}${goto 228}${time %H}${goto 263}${blink :}${goto 272}${time %M}${color}
${font Liquid Crystal:size=15}
${image img/unnamed.png -p 209,41 -s 110x110}
"""

total=header+txt01+TotalDate
#print total

f = open('clockfile', 'w')
f.write(total)  # python will convert \n to os.linesep
f.close()  # you can omit in most cases as the destructor will call it
