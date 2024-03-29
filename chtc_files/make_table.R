#!/usr/bin/env Rscript
rm(list=ls())
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
args_1 = args[1]
c = strsplit(as.character(a), "/")[[1]][2]
data = read.csv(paste0("./",c),header = F)
y = strsplit(as.character(a), "/")[[1]][1]

if (y == "2017"){
  colnames(data) <- c("Summons.Number","Plate.ID","Registration.State",
                      "Plate.Type" ,"Issue.Date","Violation.Code",
                      "Vehicle.Body.Type","Vehicle.Make","Issuing.Agency",
                      "Street.Code1","Street.Code2","Street.Code3",
                      "Vehicle.Expiration.Date","Violation.Location","Violation.Precinct",
                      "Issuer.Precinct","Issuer.Code","Issuer.Command",
                      "Issuer.Squad","Violation.Time","Time.First.Observed",
                      "Violation.County","Violation.In.Front.Of.Or.Opposite","House.Number",
                      "Street.Name","Intersecting.Street","Date.First.Observed",
                      "Law.Section","Sub.Division","Violation.Legal.Code",
                      "Days.Parking.In.Effect","From.Hours.In.Effect","To.Hours.In.Effect",
                      "Vehicle.Color","Unregistered.Vehicle.","Vehicle.Year",
                      "Meter.Number","Feet.From.Curb","Violation.Post.Code",
                      "Violation.Description","No.Standing.or.Stopping.Violation","Hydrant.Violation",
                      "Double.Parking.Violation")
}else{colnames(data) <- c("Summons.Number","Plate.ID","Registration.State",
                          "Plate.Type" ,"Issue.Date","Violation.Code",
                          "Vehicle.Body.Type","Vehicle.Make","Issuing.Agency",
                          "Street.Code1","Street.Code2","Street.Code3",
                          "Vehicle.Expiration.Date","Violation.Location","Violation.Precinct",
                          "Issuer.Precinct","Issuer.Code","Issuer.Command",
                          "Issuer.Squad","Violation.Time","Time.First.Observed",
                          "Violation.County","Violation.In.Front.Of.Or.Opposite","House.Number",
                          "Street.Name","Intersecting.Street","Date.First.Observed",
                          "Law.Section","Sub.Division","Violation.Legal.Code",
                          "Days.Parking.In.Effect","From.Hours.In.Effect","To.Hours.In.Effect",
                          "Vehicle.Color","Unregistered.Vehicle.","Vehicle.Year",
                          "Meter.Number","Feet.From.Curb","Violation.Post.Code",
                          "Violation.Description","No.Standing.or.Stopping.Violation","Hydrant.Violation",
                          "Double.Parking.Violation","Latitude","Longitude",
                          "Community.Board","Community.Council","Census.Tract",
                          "BIN","BBL","NTA" )
}


Vehicle_Make_list <- c("FORD","TOYOT","HONDA","NISSA","CHEVR","FRUEH","ME/BE","BMW","DODGE","JEEP","HYUND","GMC",
                       "LEXUS","INTER","ACURA","CHRYS","VOLKS","INFIN","SUBAR","AUDI")

Vehicle_Type_list <- c("SUBN","4DSD","VAN","DELV","SDN","2DSD","PICK","REFG","TRAC","TAXI")

dir.create(paste0("./",y))

#Make and output Vehicle_Make vs County table
data.Veh.Make.sub <- data[which(data$`Vehicle.Make` %in% Vehicle_Make_list),]
Veh_Make_County <- table(data.Veh.Make.sub[,c("Vehicle.Make","Violation.County")])
write.csv(Veh_Make_County,paste0("temp",y,"Veh_Make_County",c, ".csv"), row.names=T)

#Make and output Vehicle_Type vs County table
data.Veh.Type.sub <- data[which(data$`Vehicle.Body.Type` %in% Vehicle_Type_list),]
Veh_Type_County <- table(data.Veh.Type.sub[,c("Vehicle.Body.Type","Violation.County")])
write.csv(Veh_Type_County,paste0("temp",y,"Veh_Type_County",c, ".csv"), row.names=T)

#Make Street Name table and out put
Street_table <- table(data$`Street.Name`)
write.csv(Street_table,paste0("temp",y,"Street_table",c, ".csv"), row.names=T)


#Make and output Registration State table
Reg_table <- table(data$`Registration.State`)
write.csv(Reg_table,paste0("temp",y,"Reg_table",c, ".csv"), row.names=T)


