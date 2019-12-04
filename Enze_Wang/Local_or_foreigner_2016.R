rm(list=ls())
#输入数据
#请注意路径
data2016 = read.csv('~/Desktop/605project/nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2016.csv')
#列举列名
colnames(data2016)
#统计Registration项
Registration = data2016[,'Registration.State']
#统计各个州的违法人数
#美国各州为:
#我发现有些州的缩写找不到, 可能是输入错误, 我们直接忽略
State = c("AK","AL","AR","AZ","CA","CO","CT",
          "DC","DE","FL","GA","HI","IA","ID",
          "IL","IN","KS","KY","LA","MA","MD","ME","MI", 
          "MN","MO","MS","MT","NC","ND","NE", 
          "NH","NJ","NM","NY","NV","OH","OK", 
          "OR","PA","RI","SC","SD","TN",
          "TX","UT","VA","VT","WA","WI","WV","WY")
Registration_Freq= data.frame(table(Registration))
#统计各个州的违法频数
Registration_Freq = Registration_Freq[Registration_Freq[,1] %in% State,]
#统计各个州的违法频率
#因为本身的频率差别太大, 我取了log(Ratio), 不然图片看不清楚
Registration_Freq_Ratio = data.frame(cbind(Registration_Freq,log(Registration_Freq[,2]/sum(Registration_Freq[,2])),Registration_Freq[,2]/sum(Registration_Freq[,2])))
colnames(Registration_Freq_Ratio) = c('state','Freq','logRatio','Ratio')
#输出频数频率表
write.csv(Registration_Freq_Ratio,file='~/Desktop/605project/2016_Registration_Freq_Ratio.csv',row.names=FALSE)

#数据可视化
library(usmap)
library(ggplot2)
plot_usmap(data = Registration_Freq_Ratio,values = 'logRatio')+scale_fill_continuous(low='white',high='red',name='log registration ticket ratio of 2016 ticket in NY')+theme(legend.position='right')
ggsave("~/Desktop/605project/log_registration_ratio_of_2016_ticket_in_NY.png")

