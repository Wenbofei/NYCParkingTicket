#!/bin/bash

#9102279 line in 2014.csv
#11809234 line in 2015.csv
#10626900 line in 2016.csv
#10803029 line in 2017.csv

cd 2014
split -d -l 178477 2014.csv
rm -rf 2014.csv
cat x00 | awk 'NR>1' > x00new
rm -rf x00
mv x00new x00
cd ..

cd 2015
split -d -l 231554 2015.csv
rm -rf 2015.csv
cat x00 | awk 'NR>1' > x00new
rm -rf x00
mv x00new x00
cd ..

cd 2016
split -d -l 208371 2016.csv
rm -rf 2016.csv
cat x00 | awk 'NR>1' > x00new
rm -rf x00
mv x00new x00
cd ..

cd 2017
split -d -l 211825 2017.csv
rm -rf 2017.csv
cat x00 | awk 'NR>1' > x00new
rm -rf x00
mv x00new x00
cd ..