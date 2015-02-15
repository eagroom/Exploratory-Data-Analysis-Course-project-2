#Question: Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?
if (!require("ggplot2")) {
  install.packages("ggplot2")
  require("ggplot2")
}

setwd("~/Exploratory Data Analysis Course project 2")
sourceData<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
summaryData<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
mergedData<-merge(sourceData,summaryData)
coalData<-subset(mergedData, grepl("coal", mergedData$Short.Name))

totalEmissions <- aggregate(coalData$Emissions, list(year=coalData$year, type=coalData$Short.Name), sum)
names(totalEmissions)<- c("Year", "Sources", "TotalEmis")

png(file = "plot4.png", width = 1000, height = 426, units = "px")
qplot(Year, TotalEmis, data = totalEmissions, color = Sources, geom="line", ylab="Total Emissions", main = "Total Emissions From 1999 - 2008 for coal combustion-related sources")
dev.off()  #close the PNG device