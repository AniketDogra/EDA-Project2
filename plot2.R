if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

balt_data <- subset(NEI, fips == "24510")
t <- tapply(balt_data$Emissions, balt_data$year, sum)

png("plot2.PNG")
barplot(t, xlab = "Year", ylab = "Total PM-2.5 Emissions", main = "total PM - 2.5 emissions in Baltimore")
dev.off()
