import time, os



DateCommand='date +"%m-%d-%y"'
Date0=os.popen(DateCommand).read()


def job():
	global Date0
	DateNow=os.popen(DateCommand).read()
	if DateNow != Date0:
		os.system("python clock01.py")
		Date0=os.popen(DateCommand).read()


if __name__ == '__main__':
    while True:
        job()
        time.sleep(60)
