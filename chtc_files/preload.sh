#!/bin/bash
rm -rf 2014 2015 2016 2017 nyc-parking-tickets
mkdir 2014 2015 2016 2017 nyc-parking-tickets

cd nyc-parking-tickets
wget ftp://mnxunluuhlfkaeq:filemail@1001.filemail.com/nyc-parking-tickets.zip
unzip nyc-parking-tickets.zip
cd ..

cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2014__August_2013___June_2014_.csv 2014/2014.csv
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2015.csv                           2015/2015.csv
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2016.csv                           2016/2016.csv
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2017.csv                           2017/2017.csv

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

rm -rf nyc-parking-tickets

