#!/usr/bin/env Rscript
rm(list=ls())
library('data.table')
options(stringsAsFactors = F)

args = commandArgs(trailingOnly=TRUE)

if(length(args) == 2){
  a = as.character(args[1])
  b = as.character(args[2])
} else {
  cat('usage: Rscript myscript.R <data name> <saving target >\n', file=stderr())
  stop()
}


data = fread(paste0("./",a))

chunk <- function(x,n) split(x, factor(sort(rank(x)%%n)))
index_list <- 1:dim(data)[1]

list_data <- chunk(index_list,100)

for(i in 1:100){
  name <- paste(a,"_part",i,sep = "")
  data_part <- data[unlist(list_data[i]),]
  write.csv(data_part,file = paste0(b,"/",name) ,row.names = F)
}

