setwd("/Users/satya/Rprog/Exploratory_Data_Analysis")
#reading full data set
alldata <- read.table("household_power_consumption.txt", header = TRUE,sep=";",quote="",comment.char = "",nrows=2075259,na.strings="?")
#change column "Date" to date format & filter in the dates needed for this project
alldata$Date <- as.Date(alldata$Date, format="%d/%m/%Y")
data <-subset(alldata,Date >= "2007-02-01" & Date <= "2007-02-02")
# create a new column that shows date&time
date_time <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(date_time)

#Code to create plot2
plot(data$Datetime, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

