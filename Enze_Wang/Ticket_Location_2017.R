rm(list=ls())
#输入数据
#请注意路径
data2017 = read.csv('~/Desktop/605project/nyc-parking-tickets/Parking_Violations_Issued_-_Fiscal_Year_2017.csv')
#列举列名
colnames(data2017)
#我们想做纽约市的可视化, 对Street Name先进行统计, 把出现次数比较多街道的找出来

Location = data.frame(data2017[,c('Street.Name')])
Location_Freq = data.frame(table(Location))
#按降序排序
Location_Freq = Location_Freq[order(Location_Freq[,2],decreasing = TRUE),]
#我们先将Street Name转化为经纬度
library(ggplot2)
library(leaflet)
library(tmaptools)
library(mapview)
#如果我们可视化前10个地址
N=2000
OurLocation = Location_Freq[1:N,]
for(i in 1:N){
  #提取一行地址
  #i=1
  Street = Location_Freq[i,1]
  #搜索地址的经纬度, 图中圆圈的半径就是出事故的频率的开根
  #有些时候搜索不到地址 , 所以一定要tryCatch
  
  #OurLocation[i,3] = try(geocode_OSM(paste(Street,', New York, NY,  United States of America'))$coords[1])
  #OurLocation[i,4] = try(geocode_OSM(paste(Street,', New York, NY,  United States of America'))$coords[2])
  delayedAssign("do.next", {next})
  tryCatch({OurLocation[i,3] = geocode_OSM(paste(Street,', New York, NY,  United States of America'))$coords[1]},error=function(e) force(do.next))
  tryCatch({OurLocation[i,4] = geocode_OSM(paste(Street,', New York, NY,  United States of America'))$coords[2]},error=function(e) force(do.next))
  OurLocation[i,5] = sqrt(Location_Freq[i,2])
}
colnames(OurLocation) = c('Location','Freq','lng','lat','radius')
#使用geocode_OSM搜索地址很慢, 不建议给太多地址搜索经纬度, 在我的电脑上搜索10个地址用时大概1分钟, 可能用并行系统会快.
OurLocation=na.omit(OurLocation)
OurLocation=na.omit(OurLocation)
write.csv(OurLocation,file='~/Desktop/605project/2017_OurLocation',row.names=FALSE)
qpal <- colorQuantile("YlOrRd", OurLocation$radius, n = 4)
webshot::install_phantomjs()
a=leaflet(OurLocation) %>% 
  addTiles() %>%
  #zoom 提供地图的高度, -74, 40.71是地图中心.
  setView(-73.9, 40.71, zoom = 11) %>%
  addProviderTiles("CartoDB.Positron")%>%
  addCircles(lng = OurLocation$lng, lat = OurLocation$lat , weight = 1,
             radius = OurLocation$radius, color = ~qpal(radius))
#把地图保存为图片
mapshot(a, file =  "~/Desktop/605project/2017_Location.png")

leaflet(OurLocation) %>% 
  addTiles() %>%
  #zoom 提供地图的高度, -74, 40.71是地图中心.
  setView(-73.9, 40.71, zoom = 11) %>%
  addProviderTiles("CartoDB.Positron")%>%
  addCircles(lng = OurLocation$lng, lat = OurLocation$lat , weight = 1,
             radius = OurLocation$radius, color = ~qpal(radius))
#把地图保存为图片

