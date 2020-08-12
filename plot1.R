plot1<-function(){
  png("plot1.png")
  model<-read.csv("household_power_consumption.txt",sep = ";")
  df1<-subset(model,Date=="1/2/2007")
  df2<-subset(model,Date=="2/2/2007")
  df<-rbind(df1,df2)
  df<-df[complete.cases(df),]
  hist(as.numeric(df$Global_active_power),col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
  dev.off()
}