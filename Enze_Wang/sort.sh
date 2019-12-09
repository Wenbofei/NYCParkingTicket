cat 2014/00 | awk 'NR>1' > 2014/00new
rm -rf 2014/00
mv 2014/00new 2014/00