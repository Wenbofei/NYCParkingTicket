#!/bin/bash

head0=$(head -1 2017data00)

for i in $(cat namelist2017)
do 
if [ "$i"x != "data00"x ] 
then
sed -i "1i$head0" $i
fi
done




for i in $(cat namelist2017)
do
mv $i $i.csv
done

