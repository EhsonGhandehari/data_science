# Reading in the files

setwd("/Users/ehson/Downloads/exdata-data-NEI_data") # Changing the working directory
library("plyr")
library("magrittr")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 2

# subsetting only data from Baltimore

baltimore<-NEI %>% subset(fips=="24510") %>% plyr::ddply(.(year),summarize,Emissions_sum=sum(Emissions))

png(filename="plot2.png")
with(baltimore,plot(year,Emissions_sum,main="Total PM2.5 in Baltimore, 1999-2008",
                    xlab="Year", ylab="PM2.5 emissions (tons)"))

dev.off()