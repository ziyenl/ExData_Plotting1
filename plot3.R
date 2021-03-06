data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
subdata <- subset(data, as.Date(data$Date, format="%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d"))
subdata$date_time <- strptime(paste(subdata$Date,subdata$Time), "%d/%m/%Y%H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(subdata$date_time, as.numeric(as.character(subdata$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="", col="black")
lines(subdata$date_time, as.numeric(as.character(subdata$Sub_metering_2)), col="red", type="l")
lines(subdata$date_time, as.numeric(as.character(subdata$Sub_metering_3)), col="blue", type="l")
legend("topright",cex=0.7, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par()
dev.off()