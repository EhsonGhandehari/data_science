# Reading in the files

setwd("/Users/ehson/Downloads/exdata-data-NEI_data") # Changing working directory
library("plyr")
library("magrittr")
library("ggplot2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 6

# finding all the possible SCC numbers related to Motor Vehicles in Baltimore and L.A.

needed<-NEI$SCC[grep("motor vehicles",SCC$SCC.Level.Three,ignore.case=TRUE)]
Baltimore.LA_MV<-NEI %>% subset(fips=="24510" | fips == "06037"  & SCC %in% needed) %>% plyr::ddply(.(fips,year),summarize,Emissions_sum=sum(Emissions))
colnames(Baltimore.LA_MV)[1]<-"Location"
Baltimore.LA_MV$Location<-gsub("24510","Baltimore city",Baltimore.LA_MV$Location)
Baltimore.LA_MV$Location<-gsub("06037","Los Angeles county",Baltimore.LA_MV$Location)


# now plotting it with base plot system.

plot6<-ggplot(Baltimore.LA_MV, aes(x=year,y=Emissions_sum,colour=Location),size=3)+geom_point()+theme_classic()+
  scale_x_continuous(breaks=seq(1999, 2008,1))+labs(x="Year", y="PM2.5 emissions (tons)")+
  ggtitle("Total Motor Vehicle Related PM2.5 over Year \n *missing data for 1999 and 2008 for L.A.") 


png(filename="plot6.png")
plot6
dev.off()