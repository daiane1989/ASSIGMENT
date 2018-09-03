setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana4/ASSIGMENT/ASSIGMENT")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)

#2)Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510"\color{red}{\verb|fips == "24510"|}
#fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

soma = NEI%>%filter(fips==24510)%>%group_by(year)%>%summarise(total =sum(Emissions))

barplot(soma$total,names.arg = c("1999","2002","2005","2008"),ylab="PM2.5 (ton)",xlab = "year",col = "blue",main="Annual Emission")


png("Plot2.png")

dev.set(2)

dev.copy(png, "Plot2.png")

dev.off()


