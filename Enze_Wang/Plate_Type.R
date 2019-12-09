rm(list=ls())
#输入数据
options(stringsAsFactors = F)
#请注意路径
data2014 = read.csv('~/Desktop/605project/nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2014__August_2013___June_2014_.csv')
#列举列名
colnames(data2014)
#统计Registration项
#Plate type, Vehicle body type/brand:
Plate_Type = data2014[,'Plate.Type']
Vehicle.Make = data2014[,'Vehicle.Make']

Plate_Freq = data.frame(table(Plate_Type))
Plate_Freq = Plate_Freq[order(Plate_Freq[,2],decreasing = TRUE),]

write.csv(Plate_Freq,file='~/Desktop/605project/2014_Plate_Freq.csv',row.names=FALSE)

Make_Freq = data.frame(table(Vehicle.Make))
Make_Freq = Make_Freq[order(Make_Freq[,2],decreasing = TRUE),]


write.csv(Make_Freq,file='~/Desktop/605project/2014_Make_Freq.csv',row.names=FALSE)

