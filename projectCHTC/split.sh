#!/bin/bash

#910227 line in 2014.csv
#11809234 line in 2015.csv
#10626900 line in 2016.csv
#10803029 line in 2017.csv

split -d -l 182005 2014/2014.csv
rm -rf 2014/2014.csv
cat x00 | awk 'NR>1' > x00new
rm -rf x00
mv x00new x00