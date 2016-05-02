# Key Quantities

TP <- 1;
FP <- 1;  # type 1 error
FN <- 1;  # type 2 error
TN <- 1; 

sensitity <- TP / (TP + FN);
specificity <- TN / (FP + TN);
ppv <- TP / (TP + FP);
npv <- TN / (FN + TN);
accuracy <- (TP +TN) / (TP + FP + FN + TN)

# example from lecture 6
TP <- 9900;
FP <- 900;  # type 1 error
FN <- 100;  # type 2 error
TN <- 89100; 
Total = TP+FP+FN+TN;

sensitity <- TP / (TP + FN);
specificity <- TN / (FP + TN);
ppv <- TP / (TP + FP);
npv <- TN / (FN + TN);
accuracy <- (TP +TN) / (TP + FP + FN + TN)

(100000 - 10000) * .99
90000 * .01

# number 5 from quiz 1
TP <- .99;
FP <- 9.9999;  # type 1 error
FN <- .01;  # type 2 error
TN <- 99989.0001; 
Total = TP+FP+FN+TN;

sensitity <- TP / (TP + FN);
specificity <- TN / (FP + TN);
ppv <- TP / (TP + FP);
npv <- TN / (FN + TN);
accuracy <- (TP +TN) / (TP + FP + FN + TN)

99 / (99 + 999)