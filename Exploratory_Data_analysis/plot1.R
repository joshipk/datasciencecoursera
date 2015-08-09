# Set input file path and name
hpc_File <- "./household_power_consumption.txt"

# Read file in data.frame
hpc <- read.table(hpc_File, header=TRUE, sep=";", stringsAsFactors=FALSE)

# Select only required data
hpc_subset <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

# create a numeric vector of the required column
gAP <- as.numeric(hpc_subset$Global_active_power)

# set graphic device
png("plot1.png")

# plot the graph
hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close the graphic device
dev.off()
