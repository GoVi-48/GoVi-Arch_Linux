import time, os

#  /dev/sda1

DiskSearchCommand="df -PTh 2>/dev/null | grep -E 'dev|media' | egrep -v '^.*(tmp|proc|sys|var|pts|daemon|root|gvfs|efi).*$' | awk '{ print $1}'"
Partition_Name0=os.popen(DiskSearchCommand).read().split() # 


def job():
	global Partition_Name0	
	Partition_NameActuel=os.popen(DiskSearchCommand).read().split() # 
	if Partition_NameActuel!= Partition_Name0:
		os.system("python disk01.py")
		#print Partition_NameActuel
	Partition_Name0=os.popen(DiskSearchCommand).read().split() # 


if __name__ == '__main__':
    while True:
        job()
        time.sleep(4)
