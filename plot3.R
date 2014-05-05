setwd("~\\..\\Desktop")

## Read in the entire data file
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Extract the dates and times and convert them to a proper format
dates <- as.Date(df$Date,"%d/%m/%Y")
datesTimes <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

## Subset the dates that we care about
df2 <- df[which(dates == as.Date("2007-02-01") | dates== as.Date("2007-02-02")),]
dt2 <- datesTimes[which(dates == as.Date("2007-02-01") | dates== as.Date("2007-02-02"))]

setwd("~\\GitHub\\ExData_Plotting1")

## Create plot 3
plot(dt2,df2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dt2,df2$Sub_metering_2,type="l",col="red")
lines(dt2,df2$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()