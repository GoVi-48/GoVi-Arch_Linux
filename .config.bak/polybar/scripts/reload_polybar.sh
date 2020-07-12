 #!/usr/bin/env bash
 
 killall polybar
 sleep 2
 polybar govi >> /tmp/polygovi.log 2>&1 &
