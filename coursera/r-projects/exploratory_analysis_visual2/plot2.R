# Author: Ehson Ghandehari
# the files was read into R as "Data" object.

data<-read.table("/Users/ehson/Downloads/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")
data$RealTime <-paste(data$Date,data$Time)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")  # I changed the dates to the right format.
data$RealTime<-strptime(data$RealTime, format="%d/%m/%Y %H:%M:%S")  # I changed the dates to the right format.

data_selected<-subset(data,Date=="2007-02-01" | Date=="2007-02-02") # subset two days from data

# creating the PNG file, graph, and closing the device.

png(filename="plot2.png", width=480, height=480,units="px")
with(data_selected,plot(RealTime,Global_active_power,type="l",ylab="Golbal Active Power (killowatts)",xlab="\n"))
dev.off()


