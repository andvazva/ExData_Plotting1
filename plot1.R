
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

## PLOTTING DATA

#Plt1
selected_data$Global_active_power<-as.numeric(selected_data$Global_active_power)
png(file="plot1.png")
hist(selected_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()




