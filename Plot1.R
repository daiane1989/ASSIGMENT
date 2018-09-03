setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana4/ASSIGMENT/ASSIGMENT")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

dir()

attach(NEI)

sum(Emissions,by=year)

soma = group_by(NEI,year)%>%summarise(Total=sum(Emissions))

barplot(soma$Total,names.arg = c("1999","2002","2005","2008"),ylab="PM2.5 (ton)",xlab = "year",col = "blue",main="Total Emission")

png("Plot1.png")

dev.set(2)

dev.copy(png, "Plot1.png")

dev.off()


