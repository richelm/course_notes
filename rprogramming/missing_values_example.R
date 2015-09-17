
df = data.frame(day = sort(rep(1:5,3)), 
                interval = rep(5*(1:3),5),
                steps = c(2,3,4,NA,6,7,8,NA,10,2,3,NA,5,6,7))

interval_mean <- aggregate(steps ~ interval, df, mean)

missing <- which(is.na(df$steps))

for (r in missing) {
#  print(df$steps[r])
#  print(interval_mean$step[interval_mean$interval == df$interval[r]])
  df$steps[r] <- interval_mean$step[interval_mean$interval == df$interval[r]]
}
