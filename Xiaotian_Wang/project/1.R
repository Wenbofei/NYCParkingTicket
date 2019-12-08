rm(list=ls())
args = commandArgs(TRUE)
file = args[1]
data= read.csv(file)
# data = read.csv('nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2015.csv')

mydata = data.frame(data$Issue.Date)
mydata$time = data$Violation.Time
colnames(mydata)<-c('date','time')

date = as.Date.character(mydata$date,format='%m/%d/%Y')
index = which(date<'2013-08-01')
date[index]=NA
index = which(date>'2014-08-01')
date[index]=NA

time = mydata$time

hour = as.numeric(substr(time,1,2))
index0 = which(hour>=13) # Identifying the Outlies
min = as.numeric(substr(time,3,4))
ap = substr(time,5,5)

# Removing the outliers
hour[index0]=NA
min[index0]=NA
ap[index0]=NA

index1 = which((hour!=12)&(hour!=0))
index2 = which(hour==12)
hour[index1] = hour[index1] + 12 * (ap[index1]=="P")
hour[index2] = hour[index2] - 12 * (ap[index2]=="A")

counts = c()
for(i in 1:24)
{
  counts[i] = sum(hour==i-1,na.rm=T)
}
filename = paste0(file,'_counts')
write(file=filename, counts,sep="\n")
