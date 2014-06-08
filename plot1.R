#load data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#convert date
date <- as.Date(data$Date, format = "%d/%m/%Y")

#subset a data to a specific date
subsetData <- data[date == "2007-02-01" | date == "2007-02-02",]

#draw in plot1.png
png("plot1.png", bg="transparent")
hist(subsetData$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

