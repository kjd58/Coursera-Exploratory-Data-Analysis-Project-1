# Coursera Exploratory Data Analysis Project 1 part three
# Recreate the required plot from the supplied data

# read in the data file
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses = c("character","character",rep("numeric",7)))                        


# Filter out dates outside of 01/02/2007 and 02/02/2007 (dd/mm/yy)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# combine the date and time columns together with the data formated as dd/mm/yy hh:mm:ss
data$Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Date_Time <- as.POSIXct(data$Date_Time)

# remove the time and date columns as they are now redundant
data <- subset(data, select=-c(Date,Time))

# create the graphics file
png("plot3.png",height=480,width=480)

# create the plot
with(data, {
  plot(Sub_metering_1~Date_Time, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date_Time,col='Red')
  lines(Sub_metering_3~Date_Time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# switch off the graphics device to save the graphics file
dev.off()

