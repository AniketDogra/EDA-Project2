if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

combined <- merge(NEI, SCC, by="SCC")
combined_sub <- subset(combined, fips == "24510" & type == "ON-ROAD")

t <- tapply(combined_sub$Emissions, combined_sub$year, sum)
png("plot5.PNG", width=840, height=480)
barplot(t, xlab = "Year", ylab = "Total PM-2.5 Emissions", main = "total PM - 2.5 emissions from motor vehicles in Baltimore from 1999 to 2008 ")
dev.off()
