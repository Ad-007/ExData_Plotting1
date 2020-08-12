plot4<-function(){
  png("plot4.png")
  model<-read.csv("household_power_consumption.txt",sep = ";")
  df1<-subset(model,Date=="1/2/2007")
  df2<-subset(model,Date=="2/2/2007")
  df<-rbind(df1,df2)
  df<-df[complete.cases(df),]
  dateTime<-paste(as.Date(df$Date,"%d/%m/%Y"),df$Time)
  df<-df[,!names(df)==c("Date","Time")]
  df<-cbind(dateTime,df)
  df$dateTime <- as.POSIXct(dateTime)
  par(mfcol=c(2,2))
  with(df,plot(y=as.numeric(Global_active_power),x=dateTime,ylab = "Global Active Power",type = "l",xlab = ""))
  with(df,{plot(Sub_metering_1~dateTime, type="l",ylab="Energy Sub Metering", xlab="")
    lines(Sub_metering_2~dateTime,col='Red')
    lines(Sub_metering_3~dateTime,col='Blue')
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)})
  with(df,plot(y=as.numeric(Voltage),x=dateTime,ylab = "Voltage",type = "l",xlab = "datetime"))
  with(df,plot(y=as.numeric(Global_reactive_power),x=dateTime,ylab = "Global_reactive_power",type = "l",xlab = "datetime"))
  dev.off()
}