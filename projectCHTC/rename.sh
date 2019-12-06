#!/bin/bash
tar xvf nyc-parking-tickets.tar
if [ -f 2014 ]
then
  rm -rf 2014
fi
if [ -f 2015 ]
then
  rm -rf 2015
fi
if [ -f 2016 ]
then
  rm -rf 2016
fi
if [ -f 2017 ]
then
  rm -rf 2017
fi
mkdir 2014 2015 2016 2017

 
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2014__August_2013___June_2014_.csv 2014/2014.csv
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2015.csv                           2015/2015.csv
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2016.csv                           2016/2016.csv
cp nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2017.csv                           2017/2017.csv

rm -rf nyc-parking-tickets
