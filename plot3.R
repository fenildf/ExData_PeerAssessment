library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot3.png")
BWI <- aggregate(Emissions ~ year + type, data = NEI[NEI$fips == "24510", ],
                 sum)
print(qplot(year, Emissions, data = BWI, col = type,
            main = "Baltimore City"))
dev.off()

