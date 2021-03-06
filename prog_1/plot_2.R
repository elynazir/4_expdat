## getwd()
## setwd("F:/Data Science")
## setwd("F:/Data Science/4_exploratory data/prog_1")
## dir()
## Working directory is "./"
## Data directory is "./data"

## Getting full dataset
data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?", nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove data_full
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot_2
par(mfrow=c(1,1))
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file plot_2.png
dev.copy(png, file="plot_2.png", height=480, width=480)
dev.off()
