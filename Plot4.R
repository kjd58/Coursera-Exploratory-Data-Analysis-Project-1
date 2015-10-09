# read in the data file
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                 colClasses = c("character","character",rep("numeric",7)))                        


# Filter out dates outside of 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# combine the date and time columns together together with the data formated as dd/mm/yy hh:mm:ss
data$Date_Time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data$Date_Time <- as.POSIXct(data$Date_Time)

# remove the time and date columns as they are now reducant
data <- subset(data, select=-c(Date,Time))

# create the graphics file
png("Plot4.png",height=480,width=480)
# create the plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Date_Time, type="l",ylab="Global Active Power"
       , xlab="")
  plot(Voltage~Date_Time,type="l",xlab="datetime")
  plot(Sub_metering_1~Date_Time,col="Black",type="l",ylab="Energy sub metering")
  lines(Sub_metering_2~Date_Time,col='Red')
  lines(Sub_metering_3~Date_Time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Date_Time, type="l",xlab="datetime")
})
# switch off the graphics device to save the graphics file
dev.off()

