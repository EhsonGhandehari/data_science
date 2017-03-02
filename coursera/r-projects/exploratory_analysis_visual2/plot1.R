# Author: Ehson Ghandehari
# the files was read into R as "Data" object.

data<-read.table("/Users/ehson/Downloads/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")  # I changed the dates to the right format.

data_selected<-subset(data,Date=="2007-02-01" | Date=="2007-02-02") # subset two days from data

# creating the PNG file, graph, and closing the device.

png(filename="plot1.png", width=480, height=480,units="px")
with(data_selected,hist(Global_active_power,col="red",breaks=12,freq=TRUE,xlab= "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power"))
dev.off()


