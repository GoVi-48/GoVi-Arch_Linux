#!/usr/bin/env python3
import subprocess


# def mb_temp():
#     data = subprocess.run(['cat' '/sys/devices/platform/it87.2608/hwmon/hwmon2/temp1_input'])
#     print(data + ºC)
#
#
# mb_temp()

def gpu_temp():
    f = open('/sys/devices/platform/it87.2608/hwmon/hwmon2/temp1_input', 'r')
    print(f.read(2) + 'ºC')


gpu_temp()
