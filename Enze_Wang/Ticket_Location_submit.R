rm(list=ls())
#setwd('~/Desktop/605project')
Location_Freq = read.csv('street_all2017.csv',header = T)


Location_Freq = Location_Freq[order(Location_Freq[,2],decreasing = TRUE),]

library(ggplot2)
library(leaflet)
library(tmaptools)
library(mapview)

N=1000
OurLocation = Location_Freq[1:N,]
for(i in 1:N){

  Street = Location_Freq[i,1]

  delayedAssign("do.next", {next})
  tryCatch({OurLocation[i,3] = geocode_OSM(paste(Street,', New York, NY,  United States of America'))$coords[1]},error=function(e) force(do.next))
  tryCatch({OurLocation[i,4] = geocode_OSM(paste(Street,', New York, NY,  United States of America'))$coords[2]},error=function(e) force(do.next))
  OurLocation[i,5] = sqrt(Location_Freq[i,2])
}
colnames(OurLocation) = c('Location','Freq','lng','lat','radius')

OurLocation=na.omit(OurLocation)
OurLocation=na.omit(OurLocation)
write.csv(OurLocation,file='2017_OurLocation.csv',row.names=FALSE)
qpal <- colorQuantile("YlOrRd", OurLocation$radius, n = 4)
webshot::install_phantomjs()

a=leaflet(OurLocation) %>% 
  addTiles() %>%
  setView(-73.9, 40.71, zoom = 11) %>%
  addProviderTiles("CartoDB.Positron")%>%
  addCircles(lng = OurLocation$lng, lat = OurLocation$lat , weight = 1,
             radius = OurLocation$radius, color = ~qpal(radius))
mapshot(a, file =  "2017_Location.png")

leaflet(OurLocation) %>% 
  addTiles() %>%
  setView(-73.9, 40.71, zoom = 11) %>%
  addProviderTiles("CartoDB.Positron")%>%
  addCircles(lng = OurLocation$lng, lat = OurLocation$lat , weight = 1,
             radius = OurLocation$radius, color = ~qpal(radius))

