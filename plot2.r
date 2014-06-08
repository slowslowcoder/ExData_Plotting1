#load data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#convert date
date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset a data to a specific date
subsetData <- data[date == "2007-02-01" | date == "2007-02-02",]

#draw in plot1.png
png("plot2.png", bg="transparent")
with(subsetData,plot(1:dim(subsetData)[1], Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", main = "",xaxt="n"))
axis(1, at = c(1,1441,2881), labels = c("Thu","Fri","Sat"))
dev.off()

