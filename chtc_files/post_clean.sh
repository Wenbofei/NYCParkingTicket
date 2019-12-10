#!/bin/bash

rm -rf 2014 2015 2016 2017 err logs
mkdir err logs

cp *.log logs/
cp *.err err/
rm -rf *.log *.err *.out
rm -rf temp*

exit 0