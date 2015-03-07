## read file
data <- read.table("household_power_consumption.txt",
                   header=TRUE, sep=";", na.strings="?")
## Filter dates
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

## Merge and convert Date and Time fields
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

## Plot
png(filename="plot1.png", width = 480, height = 480)

hist(data$Global_active_power,
     main ="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()