# Reading in the files and loading the required package.

setwd("/Users/ehson/Downloads/exdata-data-NEI_data") # Change working directory
library("plyr")
library("magrittr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subsetting the Baltimore data, and group them based on year and type.
baltimore<-NEI %>% subset(fips=="24510") %>% plyr::ddply(.(year,type),
                   summarize,Emissions_sum=sum(Emissions))


# Plot3

plot3<-ggplot(baltimore, aes(x=year,y=Emissions_sum,colour=type),size=3)+geom_point()+theme_classic()+
     scale_x_continuous(breaks=seq(1999, 2008,1))+labs(x="Year", y="PM2.5 emissions (tons)")+
      ggtitle("Total PM2.5 over Year in Baltimore, Grouped by Source")                                                         

png(filename="plot3.png")
plot3
dev.off()


