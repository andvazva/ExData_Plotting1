#Download and unzip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="household_power.zip")
unzip("household_power.zip")

#Read dataset
data<-read.table("household_power_consumption.txt", nrow= 2075259, header = T, na.strings = "?",
                 colClasses=c("character"),sep=";")
#Filter by data
library(lubridate)
data$Date<-dmy(data$Date)
data$Time<-hms(data$Time)
int<-interval(ymd("2007-02-01"),ymd("2007-02-02"))
selected_data<-subset(data,data$Date %within% int)
selected_data<-na.omit(selected_data)

## PLOTTING DATA

#Plt3
png(file="plot3.png",height=480,width=480)
datetime<-selected_data$Date+selected_data$Time
selected_data$Sub_metering_1<-as.numeric(selected_data$Sub_metering_1)
selected_data$Sub_metering_2<-as.numeric(selected_data$Sub_metering_2)
selected_data$Sub_metering_3<-as.numeric(selected_data$Sub_metering_3)

with(selected_data,plot(datetime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=" "))
points(datetime,selected_data$Sub_metering_1,type="l")
points(datetime,selected_data$Sub_metering_2,type="l",col="red")
points(datetime,selected_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
