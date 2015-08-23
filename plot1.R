NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot1.png")
total <- aggregate(Emissions ~ year, data = NEI, sum)
plot(total$year, total$Emissions, xlab = "year", ylab = "Emissions")
dev.off()

