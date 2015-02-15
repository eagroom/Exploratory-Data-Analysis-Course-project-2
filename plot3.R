#Question: Of the four types of sources indicated by the type (point, 
# nonpoin, onroad, nonroad) variable, which of these four sources have
# seen decreases in emissions from 1999-2008 for Baltimore City? Which 
# have seen increases in emissions from 1999-2008? Use the ggplot2 plotting 
# system to make a plot answer this question.
#install.packages("Rcpp")

if (!require("ggplot2")) {
  install.packages("ggplot2")
  require("ggplot2")
}

setwd("~/Exploratory Data Analysis Course project 2")
sourceData<-readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
summaryData<-readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
baltimoreData<-subset(summaryData, fips == "24510")
totalEmissions <- aggregate(baltimoreData$Emissions, list(year=baltimoreData$year, type=baltimoreData$type), sum)
names(totalEmissions)<- c("Year", "Type", "TotalEmis")

png(file = "plot3.png", width = 685, height = 480, units = "px")
qplot(Year, TotalEmis, data = totalEmissions, color = Type, geom="line", ylab="Total Emissions", main = "Total Emissions From 1999 - 2008 for Baltimore City per type")
dev.off()  #close the PNG device