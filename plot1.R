#Queston: Have total emissions from PM2.5 decreased in the United 
# States from 1999 to 2008? Using the base plotting system, make 
# a plot showing the total PM2.5 emission from all sources for 
# each of the years 1999, 2002, 2005, and 2008.

setwd("~/Exploratory Data Analysis Course project 2")
sourceData<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
summaryData<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
totalEmissions <- aggregate(summaryData$Emissions, list(year=summaryData$year), sum)
names(totalEmissions)<- c("Year", "TotalEmmisions")
plot(totalEmissions$Year, totalEmissions$TotalEmmisions, type="b", xlab = "Total Emissions", ylab="Year", main = "Total Emissions From 1999 - 2008", pch=19)
dev.copy(png, file = "plot1.png")  ## Copy plot to PNG file 
dev.off()  #close the PNG device