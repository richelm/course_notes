t1 <- rep(c("A","B","C"),5)
t2 <- rpois(15,4)
df <- data.frame(ques=t1,resp=t2)
xtabs(~ques+resp,data=df)
