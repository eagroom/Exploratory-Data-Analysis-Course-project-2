#Question: Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

setwd("~/Exploratory Data Analysis Course project 2")
sourceData<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
summaryData<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
baltimoreData<-subset(summaryData, fips == "24510")
totalEmissions <- aggregate(baltimoreData$Emissions, list(year=baltimoreData$year), sum)
names(totalEmissions)<- c("Year", "TotalEmmisions")
plot(totalEmissions$Year, totalEmissions$TotalEmmisions, type="b", xlab = "Total Emissions", ylab="Year", main = "Total Emissions From 1999 - 2008 for Baltimore City", pch=19)
dev.copy(png, file = "plot2.png", width = 685, height = 480, units = "px")  ## Copy plot to PNG file 
dev.off()  #close the PNG device