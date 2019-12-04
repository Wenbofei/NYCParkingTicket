rm(list=ls())
#输入数据
#请注意路径
data2014 = read.csv('~/Desktop/605project/nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2017.csv')
#列举列名
colnames(data2014)
#统计Registration项
#Plate type, Vehicle body type/brand:
Plate_Type = data2014[,'Plate.Type']
Vehicle.Make = data2014[,'Vehicle.Make']

Plate_Freq = data.frame(table(Plate_Type))

Plate_Freq = Plate_Freq[order(Plate_Freq[,2],decreasing = TRUE),]

other = sum(Plate_Freq[,2]) - sum(head(Plate_Freq[,2],3))

pie(c(head(Plate_Freq[,2],3),other),labels = c(Plate_Freq[1,1],Plate_Freq[2,1],Plate_Freq[3,1],'Other'))
    

