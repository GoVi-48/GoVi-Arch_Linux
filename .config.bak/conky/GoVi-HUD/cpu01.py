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

# ---------------------------------
# determine what is the best sensor
# ---------------------------------


# test with Core - INTEL
CPUCore=os.popen("sensors | grep Core | awk '{ print $3}' | sort -r | head -n 1 | sed 's/[^0-9]*//g'").read()
CPUCore=os.popen("sensors | grep -i core | awk '!/-/'| awk '{ print $3}' | sort -r | head -n 1 | sed 's/[^0-9]*//g'").read()

if CPUCore.strip()=="":
	CPUCore=0

CPUCore=float(CPUCore)/10


# test with temp1 - AMD
#CPUTemp=os.popen("sensors | grep temp | awk '{ print $2}' | sort -r | head -n 1 | sed 's/[^0-9]*//g'").read()
CPUTemp=os.popen("sensors | grep -i temp | awk '!/-/'| awk '{ print $2}' | sort -r | head -n 1 | sed 's/[^0-9]*//g'").read()


if CPUTemp.strip()=="":
	CPUTemp=0
CPUTemp=float(CPUTemp)/10


if CPUTemp>CPUCore:
	TemperatureSensor="sensors | grep temp | awk '!/-/' | awk '{ print $2}' | sort -r | head -n 1"
else:
	TemperatureSensor="sensors | grep Core | awk '!/-/' | awk '{ print $3}' | sort -r | head -n 1"


# determine installed language
#Language_installed=os.popen("locale | grep LANG").read()
#print Language_installed

# number of cores
NumberOfCores=os.popen("cat /proc/cpuinfo | grep proc | wc -l").read()
#NumberOfCores=12
# print NumberOfCores

CpuInf=os.popen("echo `grep -m1 'model name' /proc/cpuinfo| sed -n '/: /s/.............//p'`").read().replace("	", " ")
# print CpuInf



DistroID=os.popen("lsb_release -si | tr '[:upper:]' '[:lower:]'").read()
if "raspbian" in DistroID:
	txt01="""
gap_x 15
gap_y 375

lua_load allcombined.lua

TEXT
${image img/cpu2.png -p 0,0 -s 30x30}
${offset 35}${font AvantGardeLTMedium:size=14}${color Tan1}"""+CpuInformation[Language]+""" ${color}${hr 2}
# ${font}${color}${execi 1000 cat /proc/cpuinfo | grep 'model name' | sed -e 's/model name.*: //'| uniq}
# ${color lightgrey}"""+Temperature[Language]+""" ${texeci 10 echo $((`cat /sys/class/thermal/thermal_zone0/temp`/1000))°C}
# ${alignc}${color #000000}${cpugraph 20,318 000000 FFEF00}"
"""
else:

	txt01="""
gap_x 15
gap_y 520

lua_load allcombined.lua


TEXT
${image img/cpu2.png -p 0,0 -s 30x30}
${offset 35}${font Good Times:size=12}${color Tan1}"""+CpuInformation[Language]+""" ${color}${hr 2}
${font}${color}${execi 1000 cat /proc/cpuinfo | grep 'model name' | sed -e 's/model name.*: //'| uniq}
${color lightgrey}"""+Temperature[Language]+""": ${alignr}${texeci 10 """+TemperatureSensor+"""}
${alignc}${color #000000}${cpugraph 20,318 000000 FFFFFF}${color}
"""

#${lua gradbar 100 161 ${cpu cpu2} 100 36 2 6 1 0xFFFFFF 0.25 0x00FF00 1 0xFFFF00 1 0xFF0000 1}
#CpuGraph=" ${goto 100}${color #FFEF00}${cpubar cpu"+str(Cores+1)+" 6,100}"

#${lua gradbar {50,82,"${cpu cpu1}",100,50,2,10,1,0xFFFFFF,0.25,0xFFFFFF,1,0xFFFF00,1,0xFF0000,1}}${goto 220}${cpu cpu1}%       

# ${lua gradbar {100 125, "${cpu 2}" ,100, 40, 2, 10, 1, 0xFFFFFF, 0.25, 0x00FF00, 1, 0xFFFF00, 1, 0xFF0000 1}
# ${platform coretemp.0 temp 1}

# CPU1 ${lua gradbar {50,82,"${cpu cpu1}",100,50,2,10,1,0xFFFFFF,0.25,0xFFFFFF,1,0xFFFF00,1,0xFF0000,1}}${goto 220}${cpu cpu1}%       

#"${cpu cpu1}"

List = []
Height=110
#NumberOfCores=1
for Cores in range(int(NumberOfCores)):
    Comment="# CPU"+str(Cores+1)+"\n"
    CpuName=""+Cpu[Language]+" "+str(Cores+1)
    CpuUsage="${goto 50} : ${cpu cpu"+str(Cores+1)+"}%"
    CpuGraph=' ${lua gradbar {100, '+str(Height)+', "${cpu cpu'+str(Cores+1)+'}", 100, 40, 2, 10, 1, 0xFFFFFF, 0.25, 0x00FF00, 1, 0xFFFF00, 1, 0xFF0000, 1}}'
    CpuFrequency="${goto 230}${color}${freq "+str(Cores+1)+"} MHz"
    BackgroundImage="${image img/trans-bg240.png -p 96,"+str(Height-5)+" -s 121x11}"+"\n"

    List.append(Comment)
    List.append(CpuName)
    List.append(CpuUsage)
    List.append(CpuGraph)
    List.append(CpuFrequency)
    List.append(BackgroundImage)

    Height=Height+15
TotalCpu=''.join(List)
total=header+txt01+TotalCpu
#print (total)

f = open('cpufile', 'w')
f.write(total)  # python will convert \n to os.linesep
f.close()  # you can omit in most cases as the destructor will call it
