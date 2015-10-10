# Coursera Exploratory Data Analysis Project 1 part two
# Recreate the required plot from the supplied data

# read in the data file
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses = c("character","character",rep("numeric",7)))                        


# Filter out dates outside of 01/02/2007 and 02/02/2007 (dd/mm/yy)
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# combine the date and time columns together with the data formated as dd/mm/yy hh:mm:ss
data$Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# remove the original time and date columns as they are now redundant
data <- subset(data, select=-c(Date,Time))

# create the graphics file
png("plot2.png",height=480,width=480)

# create the plot
plot(data$Date_Time,data$Global_active_power,type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

# switch off the graphics device to save the graphics file
dev.off()

