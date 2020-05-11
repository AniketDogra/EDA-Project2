if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

combined <- merge(NEI, SCC, by="SCC")

rows <- grepl("coal", combined$Short.Name, ignore.case = T)
sub_data <- combined[rows,]

t <- tapply(sub_data$Emissions, sub_data$year, sum)
png("plot4.PNG")
barplot(t, xlab = "Year", ylab = "Total PM-2.5 Emissions", main = "total Coal source PM - 2.5 emissions from 1999 to 2008")
dev.off()
