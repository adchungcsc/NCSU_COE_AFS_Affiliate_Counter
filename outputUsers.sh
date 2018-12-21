#!/bin/bash

cd /afs/unity.ncsu.edu/users/;
USERS=/afs/unity.ncsu.edu/users/*;
rm -f /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDs.txt
rm -f /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt

:' TEMP. COMMENTED OUT
#change directory into more readable form
for i in $USERS
do
        cd $i
        echo * >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt
done
'
#Select only users whose unity IDs start with a and b
cd /afs/unity.ncsu.edu/users/a/
echo * >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt
cd /afs/unity.ncsu.edu/users/b/
echo * >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt

#sort out users and put users into more readable form
sed 's/ /\n/g' /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt  >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDs.txt

NCSUAFFILIATES=/afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDs.txt

affiliates=0