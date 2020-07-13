 #!/usr/bin/env bash
 
 killall -q polybar
 
 sleep 5
 
 polybar -r govi >> /tmp/polygovi.log 2>&1 &
