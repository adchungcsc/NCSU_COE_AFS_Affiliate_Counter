#!/bin/bash

cd /afs/unity.ncsu.edu/users/;
USERS=/afs/unity.ncsu.edu/users/*;
#reset files
rm -f /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDs.txt
rm -f /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt

#change directory into more readable form
for i in $USERS
do
        cd $i
        echo * >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt
done
#temp code that only selected users in a and b category
:'#Select only users whose unity IDs start with a and b
cd /afs/unity.ncsu.edu/users/a/
echo * >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt
cd /afs/unity.ncsu.edu/users/b/
echo * >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt
'
#sort out users and put users into more readable form
sed 's/ /\n/g' /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt  >> /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDs.txt

NCSUAFFILIATES=/afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDs.txt

affiliates=0

#count how many staff, students, and university affiliates are registered in AFS.
while read user
do
        affiliates=`expr $affiliates + 1`
        echo $affiliates
done < $NCSUAFFILIATES
echo 'There are ' $affiliates " staff, students, and university affiliates registered in NCSU's AFS."

#delete temp raw data file (useless)
rm -f /afs/unity.ncsu.edu/users/a/adchung/ShellScripts/StudentIDsTemp.txt
