if(!exists("NEI")){
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

library(ggplot2)

balt_data <- subset(NEI, fips == "24510")
t <- aggregate(Emissions ~ year + type, balt_data, sum)
png("plot3.PNG")
g <- ggplot(t, aes(year, Emissions, color = type)) + geom_line()
g <- g + xlab("Years") + ylab("Total Emissions") + ggtitle("Total Emissions in Baltimore City")
print(g)
dev.off()
