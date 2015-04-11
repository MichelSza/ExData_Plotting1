
getwd()
#setwd("C:\\Users\\d759303\\Google Drive\\learning\\Exploratory Data Analysis\\Week 1")

message ("Downloading the zip file")
setInternet2(use = TRUE)
temp <- tempfile()
setInternet2(use = TRUE)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
Cons <- read.table(unz(temp,"household_power_consumption.txt"), header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings="?")
unlink(temp)

# read the file and create a table
#head(Cons)
message ("creating a table")
Formated_DateTime <- strptime(paste(Cons[,1], Cons[,2]), "%d/%m/%Y %H:%M:%S")
Formated_Date <- as.Date(Formated_DateTime)
Cons <- cbind(Cons, Formated_DateTime, Formated_Date)
f <- Cons[Cons$Formated_Date == "2007-02-01" | Cons$Formated_Date == "2007-02-02",]
head(f)

# cleaning
Cons <-0;
Formated_DateTime<-0;
Formated_Date <-0;

#plotting 
plotName <- "plot4.png"
png(plotName, width = 480, height = 480)
par(mfcol=c(2,2)); 
# plot 1
plot(f$Formated_DateTime, f$Global_active_power, type="l", xlab="", ylab= "Global Active Power (kilowatts)" )

# plot 2
plot(f$Formated_DateTime, f$Sub_metering_1, type="l", xlab="", ylab= "Energy Sub Metering" )
points(f$Formated_DateTime, f$Sub_metering_2, type="l", col="red")
points(f$Formated_DateTime, f$Sub_metering_3, type="l", col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

# plot 3
plot(f$Formated_DateTime, f$Voltage, type="l", xlab="Datetime", ylab= "Voltage" )

# plot 4
plot(f$Formated_DateTime, f$Global_reactive_power, type="l", xlab="Datetime", ylab= "Global_reactive_power" )

dev.off()
message( paste (plotName," created"))


