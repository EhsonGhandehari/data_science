# Reading in the files

setwd("/Users/ehson/Downloads/exdata-data-NEI_data") # Change working directory
library("plyr")
library("magrittr")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 4

# finding all the possible SCC numbers related to coal combustion-related

needed<-NEI$SCC[grep("coal",SCC$SCC.Level.Three,ignore.case=TRUE)]
US_coal<-NEI %>% subset(SCC %in% needed) %>% plyr::ddply(.(year),summarize,Emissions_sum=sum(Emissions))

# now plotting it with base plot system.

png(filename="plot4.png")
with(US_coal,plot(year,Emissions_sum,main="Total Coal-Combustion Related PM2.5 in US, 1999-2008",
                    xlab="Year", ylab="PM2.5 emissions (tons)"))

dev.off()