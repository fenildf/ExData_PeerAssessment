library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot6.png")
scc_list <- SCC[grep("Mobile (.*?) Vehicles", SCC$EI.Sector), ]$SCC
data.mobile <- NEI[NEI$fips %in% c("24510", "06037") & NEI$SCC %in% scc_list, ]
data.mobile$city = ifelse(data.mobile$fips == "24510",
                          "Baltimore City", "Los Angeles County")
data.draw <- aggregate(Emissions ~ year + city, data = data.mobile, sum)
print(qplot(year, Emissions, data = data.draw, col = city,
            main = "emissions from motor vehicle in Baltimore City and Los Angeles County"))
dev.off()

