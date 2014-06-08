#load data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#convert date
date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset a data to a specific date
subsetData <- data[date == "2007-02-01" | date == "2007-02-02",]

#draw in plot4.png

png("plot4.png", bg="transparent")
par(mfcol = c(2,2))

with(subsetData,plot(1:dim(subsetData)[1], Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", main = "",xaxt="n"))
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

with(subsetData,plot(1:dim(subsetData)[1], Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", main = "",xaxt="n"))
with(subsetData,lines(1:dim(subsetData)[1], Sub_metering_2,col="red"))
with(subsetData,lines(1:dim(subsetData)[1], Sub_metering_3,col="blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n", lwd=1,col=c("black","red","blue"))
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

with(subsetData,plot(1:dim(subsetData)[1], Voltage, type = "l", xlab = "datetime", main = "",xaxt="n"))
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

with(subsetData,plot(1:dim(subsetData)[1], Global_reactive_power, type = "l", xlab = "datetime", main = "",xaxt="n"))
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))

dev.off()

