# -*- encoding: utf-8 -*-
import os
import platform
from translations import *
header = open('header.py', 'r').read()



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
else:
	Language="English"

CardDetection=os.popen("""lspci | egrep -i "vga|display" """).read().split()
print (CardDetection)
counter=0
for i in CardDetection:
	if i=="controller:":
		print i,counter
		newlist=CardDetection[counter+1:]
		print newlist
		break
	counter=counter+1

t=' '.join(newlist)
print t
#CardDetection2=os.popen("""lshw -short -class display | grep display |  perl -lane 'print "@F[2..$#F]"' > file 2>&1 """).read()
#CardDetection3=os.popen("cat file").read()
#print (CardDetection3)

txt01="""gap_x   15
gap_y 50

TEXT
"""

f = open('graphiccardfile', 'w')
f.write(txt01)  # python will convert \n to os.linesep
f.close()  # you can omit in most cases as the destructor will call it
