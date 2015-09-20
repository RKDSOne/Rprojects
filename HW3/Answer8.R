# Define function to find the median of bootstrap sample
bootstrap = function(data,n = length(data)) {
  boot.sample=sample(data, n, replace = TRUE)
  median(boot.sample)
}

# Plot distribution
x = simple.sim(100, bootstrap, faithful[['eruptions']])
par(mfrow = c(1, 1))
hist(x, probability = TRUE, main="median", col = gray(.95))