#Merger Reg state
state.list <- c("AL","AZ","AR","CA","CO","CT","DE","FL","GA","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")

reg_merge <- function(year){
  k <- year
  reg_sum <- as.data.frame(cbind(state.list,0))
  reg_sum$V2 <- as.numeric(reg_sum$V2)
  reg_sum$V2 = 0
  for(i in 0:50){
    if(i < 10){
      reg_name <- paste0("temp",k,"Reg_tablex0",i,".csv")
      reg_tab <- read.csv(reg_name)
    }else{
      reg_name <- paste0("temp",k,"Reg_tablex",i,".csv")
      reg_tab <- read.csv(reg_name)
    }
    
    reg_tab <- reg_tab[,2:3]
    row.names(reg_tab) <- NULL
    reg_tab_sub <- reg_tab[which(reg_tab$Var1 %in% state.list),]
    #reg_tab_sub$Var1 <- factor(reg_tab_sub$Var1,levels = state.list)
    reg_tab_sub <- reg_tab_sub[order(reg_tab_sub$Var1),]
    colnames(reg_tab_sub) <- c("state","count")

    colnames(reg_sum) <- c("state.list","V2")
    test = merge(reg_sum,reg_tab_sub, by.x = 1, by.y = 1,all.x = TRUE)
    test$V2 <- as.numeric(test$V2)
    test$count_all <- apply(test[,c(2,3)],1,sum,na.rm=T)
    reg_sum = as.data.frame(cbind(test$state.list,test$count_all))
    reg_sum$V1 <- state.list
  }
  return(reg_sum)
}

#Merger Brand
brand_merge <- function(year){
  brand.list <- c("FORD","TOYOT","HONDA","NISSA","CHEVR","FRUEH","ME/BE","BMW","DODGE","JEEP","HYUND","GMC",
                  "LEXUS","INTER","ACURA","CHRYS","VOLKS","INFIN","SUBAR","AUDI")
  k <- year
  brand_sum <- as.data.frame(cbind(brand.list,0))
  brand_sum$V2 <- as.numeric(brand_sum$V2)
  brand_sum$V2 = 0
  for(i in 0:50){
    if(i < 10){
      brand_name <- paste0("temp",k,"Veh_Make_Countyx0",i,".csv")
      brand_tab <- read.csv(brand_name)
    }else{
      brand_name <- paste0("temp",k,"Veh_Make_Countyx",i,".csv")
      brand_tab <- read.csv(brand_name)
    }
    colnames(brand_sum) <- c("brand","count")
    test = merge(brand_sum,brand_tab, by.x = 1, by.y = 1,all.x = TRUE)
    test$count = as.numeric(test$count)
    test$count_all <- apply(test[,-1],1,sum,na.rm=T)
    brand_sum = as.data.frame(cbind(test$brand, test$count_all))
    brand_sum$V1 <- brand.list 
  }
  return(brand_sum)
}

#Merger type
type_merge <- function(year){
  Vehicle_Type_list <- c("SUBN","4DSD","VAN","DELV","SDN","2DSD","PICK","REFG","TRAC","TAXI")
  k <- year
  type_sum <- as.data.frame(cbind(Vehicle_Type_list,0))
  type_sum$V2 <- as.numeric(type_sum$V2)
  type_sum$V2 = 0
  for(i in 0:50){
    if(i < 10){
      type_name <- paste0("temp",k,"Veh_Type_Countyx0",i,".csv")
      type_tab <- read.csv(type_name)
    }else{
      type_name <- paste0("temp",k,"Veh_Type_Countyx",i,".csv")
      type_tab <- read.csv(type_name)
    }
    colnames(type_sum) <- c("type","count")
    test = merge(type_sum,type_tab,by.x=1, by.y=1,all.x = TRUE)
    test$count = as.numeric(test$count)
    test$count_all <- apply(test[,-1],1,sum,na.rm=T)
    type_sum = as.data.frame(cbind(test$type, test$count_all))
    type_sum$V1 <- Vehicle_Type_list
  }
  return(type_sum)
}

#Merger street
street_merge <- function(year){
  k = year
  street_m = read.csv(paste0("temp",k,"Street_tablex0",0,".csv"),header=TRUE, row.names = 1)
  for(i in 1:50){
    if(i < 10){
      street_temp = read.csv(paste0("temp",k,"Street_tablex0",i,".csv"),header=TRUE, row.names = 1)
    }else{
      street_temp <- read.csv(paste0("temp",k,"Street_tablex",i,".csv"),header=TRUE, row.names = 1)
    }
    colnames(street_m) <- c("street","count")
    colnames(street_temp) <- c("street","count")
    test = merge(street_m, street_temp, by.x=1, by.y=1,all.x = TRUE, all.y=TRUE)
    test$count <- apply(test[,-1],1,sum,na.rm=T)
    street_name = test[,1]
    street_m = as.data.frame(cbind(test$street, test$count))
    street_m$V1 = street_name 
  }
  return(street_m)
}

for (j in 2014:2017){
  write.csv(reg_merge(j), paste0("reg_all",j, ".csv"), row.names=FALSE)
  write.csv(brand_merge(j), paste0("Brand_all",j, ".csv"), row.names=FALSE)
  write.csv(type_merge(j), paste0("type_all",j, ".csv"), row.names=FALSE)
  write.csv(street_merge(j), paste0("street_all",j, ".csv"), row.names=FALSE)
}

