# set working_dir variable
working_dir <- "~/Documents/R/"

# set working directory
setwd(working_dir)

# read the data
activity <- read.csv("activity.csv") 

missing <- which(is.na(activity$steps))
i_mean <- aggregate(steps ~ interval, activity, mean)
for (r in missing) {
  activity$steps[r] <- i_mean$steps[i_mean$interval == activity$interval[r]]
}

# get dailySteps by day
dailySteps <- aggregate(steps ~ date, activity, sum)
meanSteps <- as.integer(mean(dailySteps$steps))
medianSteps <- as.integer(median(dailySteps$steps))

# get interval steps by day
dailyAvg <- aggregate(steps ~ interval, activity, mean)

# -------

library(lubridate)
# add new column
activity$dayofweek = wday(ymd(activity$date),label=TRUE)

hpc$datetime = dmy_hms(paste(hpc$date, hpc$time))

