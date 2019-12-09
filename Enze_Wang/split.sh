#!/bin/bash

#910227 line in 2014.csv
#11809234 line in 2015.csv
#10626900 line in 2016.csv
#10803029 line in 2017.csv

split -d -l 182005 2014/2014.csv 2014/
split -d -l 236184 2015/2015.csv 2015/
split -d -l 211538 2016/2016.csv 2016/
split -d -l 216060 2017/2017.csv 2017/
rm -rf 2014/2014.csv 2015/2015.csv 2016/2016.csv 2017/2017.csv
cat 2014/00 | awk 'NR>1' > 2014/00new
rm -rf 2014/00
mv 2014/00new 2014/00
cat 2015/00 | awk 'NR>1' > 2015/00new
rm -rf 2015/00
mv 2015/00new 2015/00
cat 2016/00 | awk 'NR>1' > 2016/00new
rm -rf 2016/00
mv 2016/00new 2016/00
cat 2017/00 | awk 'NR>1' > 2017/00new
rm -rf 2017/00
mv 2017/00new 2017/00

cat x00 | awk 'NR>1' > x00new
rm -rf x00
mv x00new x00

#!/bin/bash                                                            
mkdir 2014results
mv R* S* V* 2014results
rm -rf x* 2014


#!/bin/bash                                                            
mkdir 2015results
mv R* S* V* 2015results
rm -rf x* 2015








