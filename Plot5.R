setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana4")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)

#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

sub3 = subset(NEI, fips == "24510" & type=="ON-ROAD")

baltmot.sources = aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)

qplot(year, Emissions, data = baltmot.sources, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore County") + xlab("Year") + ylab("Emission Levels")

png("Plot5.png")

dev.set(2)

dev.copy(png, "Plot5.png")

dev.off()
