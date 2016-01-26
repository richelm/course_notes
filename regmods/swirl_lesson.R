# Saved notes from Swirl lesson on ...????

fit1 <- lm(Fertility ~ Agriculture, data=swiss)
fit3 <- lm(Fertility ~ Agriculture + Examination + Education, data=swiss)

anova(fit1, fit3)
Analysis of Variance Table

Model 1: Fertility ~ Agriculture
Model 2: Fertility ~ Agriculture + Examination + Education
Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1     45 6283.1                                  
2     43 3180.9  2    3102.2 20.968 4.407e-07 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

According to the table, what is that F value? 20.968

d <- deviance(fit3)/43
n <- (deviance(fit1) - deviance(fit3)) / 2 
fvalue <- n/d

pvalue <- pf(n/d, 2, 43, lower.tail = FALSE)

| Based on the calculated p-value, a false rejection of the null hypothesis is extremely unlikely.
| We are confident that fit3 is significantly better than fit1, with one caveat: analysis of
| variance is sensitive to its assumption that model residuals are approximately normal. If they
| are not, we could get a small p-value for that reason. It is thus worth testing residuals for
| normality. The Shapiro-Wilk test is quick and easy in R. Normality is its null hypothesis. Use
| shapiro.test(fit3$residuals) to test the residual of fit3.

> shapiro.test(fit3$residuals)

Shapiro-Wilk normality test

data:  fit3$residuals
W = 0.97276, p-value = 0.336

