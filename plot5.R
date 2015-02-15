#Question: How have emissions from motor vehicle sources changed 
# from 1999-2008 in Baltimore City?

setwd("~/Exploratory Data Analysis Course project 2")
sourceData<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
summaryData<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
mergedData<-merge(sourceData,summaryData)
vehcileData<-subset(mergedData, Data.Category=="Onroad")
balitmoreVehicleData<-subset(vehcileData, fips == "24510")
totalEmissions <- aggregate(balitmoreVehicleData$Emissions, list(year=balitmoreVehicleData$year), sum)
names(totalEmissions)<- c("Year", "TotalEmis")
plot(totalEmissions$Year, totalEmissions$TotalEmis, type="b", xlab = "Total Emissions", ylab="Year", main = "Total Emissions From 1999 - 2008 of vehicles in Baltimore City", pch=19)
dev.copy(png, file = "plot5.png", width = 685, height = 480, units = "px")  ## Copy plot to PNG file 
dev.off()  #close the PNG device