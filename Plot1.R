# Coursera Exploratory Data Analysis Project 1 part one
# Recreate the required plot from the supplied data

# Read in the data file
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses = c("character","character",rep("numeric",7)))                        


# Filter out dates outside of 01/02/2007 to 02/02/2007 (dd/mm/yy)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the graphics file
png(file="plot1.png",height=480,width=480)

# Create the histogram
hist(data$Global_active_power,col="Red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Switch off the graphics device to save the graphics file
dev.off()

