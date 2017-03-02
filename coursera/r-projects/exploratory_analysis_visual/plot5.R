# Reading in the files

setwd("/Users/ehson/Downloads/exdata-data-NEI_data") # Change working directory
library("plyr")
library("magrittr")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 5

# finding all the possible SCC numbers related to Motor Vehicles in Baltimore

needed<-NEI$SCC[grep("motor vehicles",SCC$SCC.Level.Three,ignore.case=TRUE)]
Baltimore_MV<-NEI %>% subset(SCC %in% needed & fips=="24510") %>% plyr::ddply(.(year),summarize,Emissions_sum=sum(Emissions))

# now plotting it with base plot system.

png(filename="plot5.png")
with(Baltimore_MV,plot(year,Emissions_sum,main="Total Motor Vehicle Related PM2.5 in Baltimore, 1999-2008 \n no data for 2008",
                  xlab="Year", ylab="PM2.5 emissions (tons)"))

dev.off()