setwd("/Users/satya/Rprog/Exploratory_Data_Analysis")
#reading full data set
alldata <- read.table("household_power_consumption.txt", header = TRUE,sep=";",quote="",comment.char = "",nrows=2075259,na.strings="?")
#change column "Date" to date format & filter in the dates needed for this project
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
data <-subset(alldata,Date >= "2007-02-01" & Date <= "2007-02-02")
# create a new column that shows date&time
date_time <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(date_time)

#Code to create plot3
plot(data$Datetime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_2,col="Red")
lines(data$Datetime, data$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=1,y.intersp=0.5,x.intersp=0.9,cex=0.7)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()




