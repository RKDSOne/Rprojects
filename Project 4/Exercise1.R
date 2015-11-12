# Read the data from file
data = read.table("bp.txt", header = TRUE)

# Construct boxplots for finger and arm method
jpeg("Exercise 1 - boxplots.jpg", width = 1080, height = 480)
par(mfrow = c(1, 2))
boxplot(data$armsys, main = "Arm method", range = 1.5, ylab = "Systolic blood pressure (in mmHg)")
boxplot(data$fingsys, main = "Finger method", range = 1.5, ylab = "Systolic blood pressure (in mmHg)")
dev.off()

# Plot histograms for both methods
jpeg("Exercise 1 - histograms.jpg", width = 1080, height = 480)
par(mfrow = c(1, 2))
hist(data$armsys, main = "Arm method", xlab = "Systolic blood pressure (in mmHg)", breaks = 20)
hist(data$fingsys, main = "Finger method", xlab = "Systolic blood pressure (in mmHg)", breaks = 20)
dev.off()

# Construct QQ plots for both methods
jpeg("Exercise 1 - QQPlots.jpg", width = 1080, height = 480)
par(mfrow = c(1, 2))
qqnorm(data$armsys, main = "Arm method", xlab = "Systolic blood pressure (in mmHg)")
qqline(data$armsys)
qqnorm(data$fingsys, main = "Finger method", xlab = "Systolic blood pressure (in mmHg)")
qqline(data$fingsys)
dev.off()

# Compute the CI numerically using satterthwaite approx
S.x = var(data$armsys)
S.y = var(data$fingsys)
n.x = length(data$armsys)
n.y = length(data$fingsys)
v = (S.x / n.x + S.y / n.y) ^ 2 / (S.x^2 / (n.x^2 * (n.x - 1)) + S.y ^ 2 / (n.y ^ 2 * (n.y - 1)))
CI = mean(data$armsys) - mean(data$fingsys) + c(-1, 1) * qt(1 - 0.05 / 2, v) * sqrt(S.x / n.x + S.y / n.y)
CI
                                              
# Do a t test to get the confidence interval for the difference in means
t.test(data$armsys, data$fingsys, conf.level = 0.95, var.equal = FALSE)