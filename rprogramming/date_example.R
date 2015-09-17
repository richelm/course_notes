# file: date_example.R

library(lubridate)

dates <- c("4/18/1950 0:00:00","2/20/1951 0:00:00","10/10/1961 0:00:00")
county <- c("BALDWIN","","")
evtype <- c("TORNADO","HIGH WIND","HEAVY SNOW")
df <- data.frame(dates,county,evtype)
head(df)

x <- strsplit(as.character(df$dates)," ")[[1]]
