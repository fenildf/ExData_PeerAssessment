NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot4.png")
scc_list <- SCC[grep("^Fuel Comb -(.*?)- Coal$", SCC$EI.Sector), ]$SCC
data.coal <- NEI[NEI$SCC %in% scc_list, ]
data.draw <- aggregate(Emissions ~ year, data = data.coal, sum)
plot(data.draw$year, data.draw$Emissions, xlab = "year", ylab = "Emissions",
     main = "emissions from coal combustion-related sources")
dev.off()

