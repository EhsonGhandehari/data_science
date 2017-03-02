# Reading in the files

setwd("/Users/ehson/Downloads/exdata-data-NEI_data") #change the working directory
library("plyr")
library("magrittr")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Plot 1

total_pollution<-plyr::ddply(NEI,.(year),summarize,Emissions_sum=sum(Emissions))

png(filename="plot1.png")
with(total_pollution,plot(year,Emissions_sum,main="Decrease of Total PM2.5 in USA, 1999-2008",
     xlab="Year", ylab="PM2.5 emissions (tons)"))
dev.off()





