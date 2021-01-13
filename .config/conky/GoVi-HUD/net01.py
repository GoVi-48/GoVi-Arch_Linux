# -*- encoding: utf-8 -*-
import os
header = open('header.py', 'r').read()

from translations import *

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



NumberOfInterfaces=os.popen("ls /sys/class/net/ | sed '/lo/d'").read().split()
# http://asanka-abeyweera.blogspot.fr/2013/03/conditionly-displaying-network.html

# number of connections ['eth0', 'wlan0']
#NumberOfInterfaces=os.popen("/sbin/ifconfig | grep Ethernet | awk '{ print $1}'").read().split()

# print NumberOfInterfaces

#NumberOfInterfaces=['eth0','wlan0','wlan3']

# determine installed language

txt01="""
gap_x 380
gap_y 225

TEXT
${image img/earth_network.png -p 0,0 -s 30x30}
${offset 35}${font Good Times:size=12}${color Tan1}"""+NETWORK[Language]+""" ${color}${hr 2}${font}
"""

#${wireless_link_qual_perc wlp7s0} %  ${wireless_essid}
#${if_match "${addr wlp7s0}"!="No Address"}

List = []

for Interface in NumberOfInterfaces:
	TestInterface="""${if_match "${addr """+str(Interface)+"""}"!="No Address"}"""	
	ShowInterface="${goto 14}"+NetworkInterface[Language]+" ${color3}"+str(Interface)+"${color}${goto 160}"+LocaleIPadress[Language]+"${addr "+str(Interface)+"}"+"\n"
	ShowWirelessInfo="""${if_match "${wireless_mode """+str(Interface)+"""}"!=""}${goto 14}${font WIFI}b${font}ESSID : ${wireless_essid}  ${offset 10}(${wireless_link_qual_perc """+str(Interface)+"""} %) ${endif} """+"\n"
	UpDown="${goto 14}${color1}"+Sending[Language]+" ${color3}${upspeed "+str(Interface)+"}${color1}${alignr}${goto 180}${color1}"+Receiving[Language]+"${color1} ${color3}${downspeed "+str(Interface)+"}${color}"+"\n"
	Graphs="${goto 14}${upspeedgraph "+str(Interface)+"  50,140 000000 FF0000}${goto 180}${downspeedgraph "+str(Interface)+" 50,140 000000 00FF00}"+"\n"+"${voffset -5}${hr 1}"+"\n"
	Sums="${goto 14}${color1}"+Sent[Language]+"${color1} ${color2}${totalup "+str(Interface)+"}${color1}${alignr}${goto 180}${color1}"+Received[Language]+"${color}${color2}${totaldown "+str(Interface)+"}${color1}"+"\n"
	EndTestInterface="${endif}"
	List.append(TestInterface)
	List.append(ShowInterface)
	cmd="iwconfig "+str(Interface)+"  | grep Mode"
	outputcmd=os.popen(cmd).read()
	if "Access" in outputcmd:
		List.append(ShowWirelessInfo)
	#cmd="nmcli dev  | grep wi"
	#if os.popen(cmd).read() !="":
	#	List.append(ShowWirelessInfo)
	List.append(UpDown)
	List.append(Sums)
	List.append(Graphs)
	List.append(EndTestInterface)

TotalNetwork=''.join(List)

# print TotalNetwork

Public_IP_Value=PublicIPaddress[Language]+" ${texeci 10000 wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'}"+"\n\n"
#Local_IP_Value="/sbin/ifconfig "+str(Interface)+" | grep 'inet adr' | awk '{print $2}' | sed -s 's/adr://'"


# print TotalNetwork
total=header+txt01+Public_IP_Value+TotalNetwork
#print total



f = open('netfile', 'w')
f.write(total)  # python will convert \n to os.linesep
f.close()  # you can omit in most cases as the destructor will call it
