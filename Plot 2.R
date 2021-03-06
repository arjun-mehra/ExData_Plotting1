setwd("D:/Arjun/Desktop/Learning/Coursera/Signature Track/Working Directory")

power <- read.table("household_power_consumption.txt",header=T, sep=";")
power$dt <- as.Date(power$Date, format = "%m/%d/%Y")
pow <- subset(power, as.Date(power$dt)==as.Date('2007-02-01') | as.Date(power$dt)==as.Date('2007-02-02'))
pow$day<- weekdays(as.Date(pow$dt,'%d-%m-%Y'))
pow$gap<- as.numeric(as.character(pow$Global_active_power))
pow$grp<- as.numeric(as.character(pow$Global_reactive_power))
pow$vol<- as.numeric(as.character(pow$Voltage))
pow$gi<- as.numeric(as.character(pow$Global_intensity))
pow$sm1<- as.numeric(as.character(pow$Sub_metering_1))
pow$sm2<- as.numeric(as.character(pow$Sub_metering_2))
pow$sm3<- as.numeric(as.character(pow$Sub_metering_3))
pow$TD <- strptime(paste(pow$Date, pow$Time, sep=","), format="%m/%d/%Y,%H:%M:%S")

head(pow)
summary(pow$Time)
str(pow)


plot(pow$TD, pow$gap, type="n", main= "", xlab = "", ylab = "Global Active Power (kilowatts)") 
lines(pow$TD, pow$gap) 
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()



