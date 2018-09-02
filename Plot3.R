setwd("C:/Users/Daiane/Desktop/COURSERA/Exploratory data analysis/semana4")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


library(dplyr)

#Of the four types of sources indicated by the type\color{red}{\verb|type|} type (point, nonpoint, onroad, nonroad) 
#variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have 
#seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)


bal = aggregate(Emissions ~ year+ type, NEI, sum)

chart = ggplot(bal, aes(year, Emissions, color = type))
chart = chart + geom_line() +
  xlab("year") +
  ylab(expression('Total Emissions')) +
  ggtitle('Total Emissions 2.5 * From 1999 to 2008')
print(chart)

png("Plot3.png")

dev.set(2)

dev.copy(png, "Plot3.png")

dev.off()















