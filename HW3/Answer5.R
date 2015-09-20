# Define function to get average
f = function(n, a=0, b=1) {
  mu = (b + a) / 2
  sigma = (b - a) / sqrt(12)
  (mean(runif(n, a, b)) - mu) / (sigma / sqrt(n))
}

# Plot
par(mfrow = c(2, 2))
hist(f(1), probability = TRUE,main="n = 1",col = gray(.95))
hist(f(5), probability = TRUE,main="n = 5",col = gray(.95))
hist(f(10), probability = TRUE,main="n = 10",col = gray(.95))
hist(f(25), probability = TRUE,main="n = 25",col = gray(.95))