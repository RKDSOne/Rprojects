# Read the data
cancer.data = read.table("prostate_cancer.csv", sep = ",", header = TRUE)

# Fit the model with two variables
fit1 = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + (cancer.data$cancervol), cancer.data)
fit2 = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + (cancer.data$age), cancer.data)
fit3 = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + (cancer.data$benpros), cancer.data)
fit4 = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + (cancer.data$vesinv), cancer.data)
fit5 = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + (cancer.data$capspen), cancer.data)
fit6 = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + factor(cancer.data$gleason), cancer.data)
anova(fit1, fit2, fit3, fit4, fit5, fit6)
summary(fit4)

# Residual plot
jpeg("Residual plot.jpg", width = 1080, height = 480)
plot(fitted(fit4), resid(fit4), main = "Residual plot")
abline(h=0)
dev.off()

# QQ plot
jpeg("QQ Plot.jpg", width = 1080, height = 480)
qqnorm(resid(fit4), xlim = c(-3, 4))
qqline(resid(fit4))
dev.off()

# Time series plot of residuals
jpeg("Time series plot.jpg", width = 1080, height = 480)
plot(resid(fit4), type="l", main = "Time series plot")
abline(h=0)
dev.off()

# Log transform and fit the model with two variables
final.fit = lm(log(cancer.data$psa) ~ log(cancer.data$weight) + log(cancer.data$vesinv), cancer.data)
summary(final.fit)

# Residual plot
jpeg("Final - Residual plot.jpg", width = 1080, height = 480)
plot(fitted(final.fit), resid(final.fit), main = "Residual plot")
abline(h=0)
dev.off()

# QQ plot
jpeg("Final - QQ Plot.jpg", width = 1080, height = 480)
qqnorm(resid(final.fit), xlim = c(-3, 4))
qqline(resid(final.fit))
dev.off()

# Time series plot of residuals
jpeg("Final - Time series plot.jpg")
plot(resid(final.fit), type="l", main = "Time series plot")
abline(h=0)
dev.off()

# Predict for median
weight.median = median(cancer.data$weight)
ves.median = median(cancer.data$vesinv)
index = cancer.data[which(cancer.data$weight == weight.median & cancer.data$vesinv == ves.median), ]
new.data = data.frame(x = c(weight.median, ves.median))
prediction = predict(fit, newdata = new.data)
exp(prediction[index$subject])