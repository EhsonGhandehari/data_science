# Author: Ehson Ghandehari
# the files was read into R as "Data" object.

# Reading the file into an object called "data."
data<-read.table("/Users/ehson/Downloads/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?")

data$RealTime <-paste(data$Date,data$Time)        # Combining the Data and Time and adding it as a new variable  
data$Date<-as.Date(data$Date, format="%d/%m/%Y")  # I changed the dates to the right format.
data$RealTime<-strptime(data$RealTime, format="%d/%m/%Y %H:%M:%S")  # I changed the dates to the right format.

data_selected<-subset(data,Date=="2007-02-01" | Date=="2007-02-02") # subset two days from data

# creating the PNG file, graph, and closing the device.

png(filename="plot3.png", width=480, height=480,units="px")
with(data_selected,plot(RealTime,Global_active_power,ylab="Energy sub metering",xlab="\n",ylim=c(0,38),type="n"))
with(data_selected,lines(RealTime,Sub_metering_1,col="black"))
with(data_selected,lines(RealTime,Sub_metering_2,col="red"))
with(data_selected,lines(RealTime,Sub_metering_3,col="blue"))
legend("topright", lty="solid", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()


