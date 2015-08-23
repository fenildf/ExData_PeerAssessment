NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot2.png")
BWI <- aggregate(Emissions ~ year, data = NEI[NEI$fips == "24510", ], sum)
plot(BWI$year, BWI$Emissions, xlab = "year", ylab = "Emissions",
     main = "Baltimore City")
dev.off()

