#!/usr/bin/python
# Python program to display calendar of given month of the year

import calendar
from time import strftime
import locale

c = calendar.LocaleTextCalendar(locale=locale.getdefaultlocale())
c.prmonth(int(strftime("%Y")), int(strftime("%m")))



