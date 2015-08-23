NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot5.png")
scc_list <- SCC[grep("Mobile (.*?) Vehicles", SCC$EI.Sector), ]$SCC
data.mobile <- NEI[NEI$fips == "24510" & NEI$SCC %in% scc_list, ]
data.draw <- aggregate(Emissions ~ year, data = data.mobile, sum)
plot(data.draw$year, data.draw$Emissions, xlab = "year", ylab = "Emissions",
     main = "emissions from motor vehicle sources in Baltimore City")
dev.off()

