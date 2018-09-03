setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana4/ASSIGMENT/ASSIGMENT")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
balt = aggregate(Emissions ~ year+ type, NEI, sum)

SCC.sub = SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub = NEI[NEI$SCC %in% SCC.sub$SCC, ]

plot4 = ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)


png("Plot4.png")

dev.set(2)

dev.copy(png, "Plot4.png")

dev.off()

