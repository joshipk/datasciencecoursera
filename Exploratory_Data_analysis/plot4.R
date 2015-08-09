# Set input file path and name
hpc_File <- "./household_power_consumption.txt"

# Read file in data.frame
hpc <- read.table(hpc_File, header=TRUE, sep=";", stringsAsFactors=FALSE)

# Select only required data
hpc_subset <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

#Combine Date and Time to form DateTime variable vector.
datetime <- strptime(paste(hpc_subset$Date, hpc_subset$Time), "%d/%m/%Y %H:%M") 

# create a numeric vectors of the required columns
subMetering1 <- as.numeric(hpc_subset$Sub_metering_1)
subMetering2 <- as.numeric(hpc_subset$Sub_metering_2)
subMetering3 <- as.numeric(hpc_subset$Sub_metering_3)
gAP <- as.numeric(hpc_subset$Global_active_power)
gRP <- as.numeric(hpc_subset$Global_reactive_power)
voltage <- as.numeric(hpc_subset$Voltage)

# set graphic device
png("plot4.png", width=480, height=480)

# plot the graph
par(mfrow = c(2, 2)) 

plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.9, lwd=1, col=c("black", "red", "blue"), bty="n")

plot(datetime, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")

# close the graphic device
dev.off()