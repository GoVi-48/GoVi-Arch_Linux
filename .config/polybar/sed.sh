
sed -n 's/<h2><a href=/<\/a><\/h2>/p'


echo "Here is a string" | sed -n "s/.*Here\([^e]*\)string.*/\1/p"
is a 

sed -n 's/.*<h2><a href=\([^=]*\)<\/a><\/h2>.*/\1/p'


echo "Here is a string" | awk -v FS="(Here|string)" '{print $2}'
is a 
 
awk -v FS="(<h2><a href=|</a></h2>)" '{print $2}' | grep '\S'
awk -v FS="(<h2><a href=|</a></h2>)" 'NF>1 {print $2}'


echo "Here is a string" | awk -F "Here|string" '{print $2}'
is a

awk -F "<h2><a href=|</a></h2>" '{print $2}' | grep '\S'
awk -F "<h2><a href=|</a></h2>" 'NF>1 {print $2}'
