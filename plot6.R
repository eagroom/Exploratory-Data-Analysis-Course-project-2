#Question: Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes over 
# time in motor vehicle emissions?

setwd("~/Exploratory Data Analysis Course project 2")
if (!require("ggplot2")) {
  install.packages("ggplot2")
  require("ggplot2")
}

sourceData<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
summaryData<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
mergedData<-merge(sourceData,summaryData)
vehicleData<-subset(mergedData, Data.Category=="Onroad")

countyData<-subset(vehicleData, fips == "24510" | fips == "06037")
totalData<-aggregate(countyData$Emissions, list(year=countyData$year, county=countyData$fips), sum)
names(totalData)<- c("Year", "County", "TotalEmis")

sumBalitmore<-subset(totalData, County == "24510")
sumLA<-subset(totalData, County == "06037")
sumBalitmore$County <- c("Baltimore City", "Baltimore City","Baltimore City", "Baltimore City")
sumLA$County <- c("Los Angeles County", "Los Angeles County","Los Angeles County", "Los Angeles County")
totalData<-rbind(sumLA, sumBalitmore)

png(file = "plot6.png", width = 1336, height = 480, units = "px")
qplot(Year, TotalEmis, data = totalData, color = County, geom="line", ylab="Total Emissions", main = "Total Emissions From 1999 - 2008 from vehicles")
dev.off()  #close the PNG device