setwd("/Users/satya/Rprog/Exploratory_Data_Analysis")
#reading full data set
alldata <- read.table("household_power_consumption.txt", header = TRUE,sep=";",quote="",comment.char = "",nrows=2075259,na.strings="?")
#change column "Date" to date format & filter in the dates needed for this project
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
data <-subset(alldata,Date >= "2007-02-01" & Date <= "2007-02-02")
# create a new column that shows date&time
date_time <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(date_time)


#------------plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data, {
  plot(Datetime,Global_active_power, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Datetime,Voltage, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Datetime,Sub_metering_1, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Datetime,Sub_metering_2,col='Red')
  lines(Datetime,Sub_metering_3,col='Blue')
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=1,y.intersp=0.3,x.intersp=0.1,bty="n",cex=0.9)
  plot(Datetime,Global_reactive_power, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()




