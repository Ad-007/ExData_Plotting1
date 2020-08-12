plot3<-function(){
  png("plot3.png")
  model<-read.csv("household_power_consumption.txt",sep = ";")
  df1<-subset(model,Date=="1/2/2007")
  df2<-subset(model,Date=="2/2/2007")
  df<-rbind(df1,df2)
  df<-df[complete.cases(df),]
  dateTime<-paste(as.Date(df$Date,"%d/%m/%Y"),df$Time)
  df<-df[,!names(df)==c("Date","Time")]
  df<-cbind(dateTime,df)
  df$dateTime <- as.POSIXct(dateTime)
  with(df, {plot(Sub_metering_1~dateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)})
  dev.off()
}