# Read the data
cancer.data = read.table("prostate_cancer.csv", sep = ",", header = TRUE)

# Plot PSA against other variables
jpeg("PSA Vs. Prostate Weight.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$weight, main = "PSA Vs. Prostate Weight", xlab = "PSA", ylab = "Prostate Weight", xlim = c(0, 50), ylim = c(0, 100))
dev.off()

jpeg("PSA Vs. Age.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$age, main = "PSA Vs. Age", xlab = "PSA", ylab = "Age", xlim = c(0, 80), ylim = c(40, 80))
dev.off()

jpeg("PSA Vs. Benign prostatic hyperplasia.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$benpros, main = "PSA Vs. Benign prostatic hyperplasia", xlab = "PSA", ylab = "Benign prostatichyperplasia", xlim = c(0, 65), ylim = c(0, 9))
dev.off()

jpeg("PSA Vs. Seminal vesicle invasion.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$vesinv, main = "PSA Vs. Seminal vesicle invasion", xlab = "PSA", ylab = "Seminal vesicle invasion", xlim = c(0, 55), ylim = c(0, 1))
dev.off()

jpeg("PSA Vs. Capsular penetration.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$capspen, main = "PSA Vs. Capsular penetration", xlab = "PSA", ylab = "Capsular penetration", xlim = c(0, 50), ylim = c(0, 15))
dev.off()

jpeg("PSA Vs. Gleason.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$gleason, main = "PSA Vs. Gleason", xlab = "PSA", ylab = "Gleason", xlim = c(0, 50), ylim = c(6, 8))
dev.off()

# Plot the outliers
lowerq = quantile(cancer.data$weight)[2]
upperq = quantile(cancer.data$weight)[4]
iqr = upperq - lowerq
threshold.upper = (iqr * 1.5) + upperq
threshold.lower = lowerq - (iqr * 1.5)
outliers = cancer.data[which(cancer.data$weight > threshold.upper | cancer.data$weight < threshold.lower), ]
outlier.colors = (cancer.data$weight %in% outliers$weight)*1
outlier.colors = outlier.colors + 1
jpeg("Outliers.jpg", width = 1080, height = 480)
plot(cancer.data$psa, cancer.data$weight, main = "PSA Vs. Prostate Weight", xlab = "PSA", ylab = "Prostate Weight", col = outlier.colors)
dev.off()

# Fit the model
initial.fit = lm((cancer.data$psa) ~ (cancer.data$weight), cancer.data)
summary(initial.fit)

# Residual plot
jpeg("Residual plot.jpg", width = 1080, height = 480)
plot(fitted(initial.fit), resid(initial.fit), main = "Residual plot")
abline(h=0)
dev.off()

# QQ plot
jpeg("QQ Plot.jpg", width = 1080, height = 480)
qqnorm(resid(initial.fit), xlim = c(-3, 4))
qqline(resid(initial.fit))
dev.off()

# Time series plot of residuals
jpeg("Time series plot.jpg", width = 1080, height = 480)
plot(resid(initial.fit), type="l", main = "Time series plot")
abline(h=0)
dev.off()


# Transform and fit the model
final.fit = lm(log(cancer.data$psa) ~ log(cancer.data$weight), cancer.data)
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
jpeg("Final - Time series plot.jpg", width = 1080, height = 480)
plot(resid(final.fit), type="l", main = "Time series plot")
abline(h=0)
dev.off()

# Predict for median
weight.median = median(cancer.data$weight)
index = cancer.data[which(cancer.data$weight == weight.median), ]
new.data = data.frame(x = weight.median)
prediction = predict(fit, newdata = exp(new.data))
exp(prediction[index$subject])