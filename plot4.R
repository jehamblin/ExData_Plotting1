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

## Create plot 4
par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(dt2,df2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(dt2,df2$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(dt2,df2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dt2,df2$Sub_metering_2,type="l",col="red")
lines(dt2,df2$Sub_metering_3,type="l",col="blue")

## Was having trouble getting a right-justified legend, 
## so I stole this method from the help files
temp <- legend("topright",legend=c(" "," "," "),col=c("black","red","blue"),lty=1,cex=0.8,xjust=1,yjust=1,bty="n",text.width=strwidth(" Sub_metering_1 "))
text(temp$rect$left + temp$rect$w, temp$text$y,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pos=2)
plot(dt2,df2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",yaxt="n")
axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5),labels=c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.copy(png,file="plot4.png")
dev.off()
