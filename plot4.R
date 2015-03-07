## read file
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?")
## Filter dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Merge and convert Date and Time fields
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Plot
png(filename="plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(data$DateTime, data$Global_active_power,
     type ="l", xlab ="",
     ylab ="Global Active Power")

plot(data$DateTime, data$Voltage,
     type ="l", xlab ="datetime",
     ylab ="Voltage")

plot(data$DateTime, data$Sub_metering_1,
     type = "l", xlab = "", col= "black",
     ylab = "Energy sub metering")

points(data$DateTime, data$Sub_metering_2,
       type = "l", col = "red")

points(data$DateTime, data$Sub_metering_3,
       type = "l", col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1,1), bty = "n", cex = 0.9)

plot(data$DateTime, data$Global_reactive_power,
     type ="l", xlab ="datetime",
     ylab ="Global_rective_power")

dev.off()