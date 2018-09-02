setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana4")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)


#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (
#fips == "06037"\color{red}{\verb|fips == "06037"|}
#fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

baltimore_NEI = NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]
la_NEI = NEI[NEI$fips=="06037" & NEI$type=="ON-ROAD", ]

emissionBaltimore = aggregate(Emissions ~ year, baltimore_NEI, sum)
emissionLa = aggregate(Emissions ~ year, la_NEI, sum)

png("plot6.png")

rng = range(emissionBaltimore$Emissions, emissionLa$Emissions)

plot(x = emissionBaltimore$year , y = emissionBaltimore$Emissions, 
     type = "p", pch = 16, col = "blue", 
     ylab = "PM2.5 Emission", xlab = "Year",  ylim = rng, 
     main = "Motor vehicle PM2.5 Emission in LA & Baltimore from 1999 to 2008")

lines(x =emissionBaltimore$year, y = emissionBaltimore$Emissions, col = "blue")

points(x = emissionLa$year, y = emissionLa$Emissions, pch = 16, col = "red")

lines(x =emissionLa$year, y = emissionLa$Emission, col = "red")

legend("right", legend = c("LA", "Baltimore"), pch = 20, lty=1, col = c("red", "blue"), title = "City")

dev.off()