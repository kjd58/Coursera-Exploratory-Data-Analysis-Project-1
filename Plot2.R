# read in the data file
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses = c("character","character",rep("numeric",7)))                        


# Filter out dates outside of 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# combine the date and time columns together together with the data formated as dd/mm/yy hh:mm:ss
data$Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# remove the time and date columns as they are now reducant
data <- subset(data, select=-c(Date,Time))

# create the graphics file
png("plot2.png",height=480,width=480)
# create the plot
plot(data$Date_Time,data$Global_active_power,type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
# switch off the graphics device to save the graphics file
dev.off()

