if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Tapply to get emissions
t <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.PNG")
barplot(t, xlab = "Year", ylab = "Total PM-2.5 Emissions", main = "total PM - 2.5 emission from all sources for each of the years")
dev.off()
