setwd("C:\\Users\\jehamb\\Documents\\My Dropbox\\Coursera\\Exploratory Data Analysis")

## Read in the entire data file
df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## Extract the dates and times and convert them to a proper format
dates <- as.Date(df$Date,"%d/%m/%Y")
datesTimes <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

## Subset the dates that we care about
df2 <- df[which(dates == as.Date("2007-02-01") | dates== as.Date("2007-02-02")),]
dt2 <- datesTimes[which(dates == as.Date("2007-02-01") | dates== as.Date("2007-02-02"))]

## Create plot 1
hist(df2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()

## Create plot 2
plot(dt2,df2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

