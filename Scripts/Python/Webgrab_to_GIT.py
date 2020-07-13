#!/usr/bin/env python3

import schedule
import time
import datetime
import subprocess

def job():
    TNOW = datetime.datetime.now().replace(microsecond=0)
    subprocess.call([r'/home/govi/Scripts/Bash/Webgrab_Update_to_GIT.sh'])

schedule.every().day.at("00:00").do(job)
schedule.every().day.at("22:49").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)

# schedule.every(1).minutes.do(minjob)
# schedule.every().hour.do(job)
# schedule.every().day.at("10:30").do(job)
# schedule.every().monday.do(job)
# schedule.every().wednesday.at("13:15").do(job)
# schedule.every().minute.at(":17").do(job)
# schedule.every().minute.at(":05").do(job)
# schedule.every().minute.at(":10").do(job)
# schedule.every().minute.at(":15").do(job)
