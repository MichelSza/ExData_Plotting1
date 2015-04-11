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
plotName <- "plot1.png"
png(plotName, width = 480, height = 480)
par(mfcol=c(1,1));
hist(f$Global_active_power, col="red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()
message( paste (plotName," created"))