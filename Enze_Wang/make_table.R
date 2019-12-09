#!/usr/bin/env Rscript
rm(list=ls())
library('data.table')
options(stringsAsFactors = F)

args = commandArgs(trailingOnly=TRUE)

if(length(args) == 1){
  a = as.character(args[1])
  b = as.character(args[1])
} else {
  cat('usage: Rscript myscript.R <data name>\n', file=stderr())
  stop()
}



#read in data
library(data.table)
data = fread(paste0("./",a))


Vehicle_Make_list <- c("FORD","TOYOT","HONDA","NISSA","CHEVR","FRUEH","ME/BE","BMW","DODGE","JEEP","HYUND","GMC",
                       "LEXUS","INTER","ACURA","CHRYS","VOLKS","INFIN","SUBAR","AUDI")

Vehicle_Type_list <- c("SUBN","4DSD","VAN","DELV","SDN","2DSD","PICK","REFG","TRAC","TAXI")

#Make and output Vehicle_Make vs County table
data.Veh.Make.sub <- data[which(data$`Vehicle Make` %in% Vehicle_Make_list),]
Veh_Make_County <- table(data.Veh.Make.sub[,c("Vehicle Make","Violation County")])
write.csv(Veh_Make_County,paste0("Veh_Make_County",b, ".csv"), row.names=FALSE)

#Make and output Vehicle_Type vs County table
data.Veh.Type.sub <- data[which(data$`Vehicle Body Type` %in% Vehicle_Type_list),]
Veh_Type_County <- table(data.Veh.Type.sub[,c("Vehicle Body Type","Violation County")])
write.csv(Veh_Type_County,paste0("Veh_Type_County",b, ".csv"), row.names=FALSE)

#Make Street Name table and out put
Street_table <- table(data$`Street Name`)
write.csv(Street_table,paste0("Street_table",b, ".csv"), row.names=FALSE)


#Make and output Registration State table
Reg_table <- table(data$`Registration State`)
write.csv(Reg_table,paste0("Reg_table",b, ".csv"), row.names=FALSE)


