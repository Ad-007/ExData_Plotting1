plot2<-function(){
  png("plot2.png")
  model<-read.csv("household_power_consumption.txt",sep = ";")
  df1<-subset(model,Date=="1/2/2007")
  df2<-subset(model,Date=="2/2/2007")
  df<-rbind(df1,df2)
  df<-df[complete.cases(df),]
  dateTime<-paste(as.Date(df$Date,"%d/%m/%Y"),df$Time)
  df<-df[,!names(df)==c("Date","Time")]
  df<-cbind(dateTime,df)
  df$dateTime <- as.POSIXct(dateTime)
  with(df,plot(y=as.numeric(Global_active_power),x=dateTime,ylab = "Global Active Power (kilowatts)",type = "l",xlab = ""))
  dev.off()
}