# read in the data file
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses = c("character","character",rep("numeric",7)))                        


# Filter out dates outside of 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create the graphics file
png("plot1.png",height=480,width=480)
# create the histogram
hist(data$Global_active_power,col="Red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
# switch off the graphics device to save the graphics file
dev.off()

