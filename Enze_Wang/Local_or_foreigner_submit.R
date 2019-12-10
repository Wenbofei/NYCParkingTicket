rm(list=ls())
#setwd('~/Desktop/605project/')


State = c("AK","AL","AR","AZ","CA","CO","CT",
          "DC","DE","FL","GA","HI","IA","ID",
          "IL","IN","KS","KY","LA","MA","MD","ME","MI", 
          "MN","MO","MS","MT","NC","ND","NE", 
          "NH","NJ","NM","NY","NV","OH","OK", 
          "OR","PA","RI","SC","SD","TN",
          "TX","UT","VA","VT","WA","WI","WV","WY")
Registration_Freq= read.csv('reg_all2017.csv',header=T)

Registration_Freq = Registration_Freq[Registration_Freq[,1] %in% State,]

Registration_Freq_Ratio = data.frame(cbind(Registration_Freq,log(Registration_Freq[,2]/sum(Registration_Freq[,2])),Registration_Freq[,2]/sum(Registration_Freq[,2])))
colnames(Registration_Freq_Ratio) = c('state','Freq','logRatio','Ratio')

write.csv(Registration_Freq_Ratio,file='2017_Registration_Freq_Ratio.csv',row.names=FALSE)


library(usmap)
library(ggplot2)
plot_usmap(data = Registration_Freq_Ratio,values = 'logRatio')+scale_fill_continuous(low='white',high='red',name='log registration ticket ratio of 2017 ticket in NY')+theme(legend.position='right')
ggsave("log_registration_ratio_of_2017_ticket_in_NY.png")

