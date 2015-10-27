# Generate N and P
N = seq.int(from = 5, to = 100, by = 10)
P = seq.int(from = 5, to = 95, by = 10) / 100

# Define function to get 95% confidence interval
conf.int = function(N, P) {
  # Get interval with this N and P
  alpha = 0.05
  std.dev = sqrt(P * (1 - P) / N)
  x = rnorm(N, mean = P, sd = std.dev)
  ci = mean(x) + c(-1, 1) * qnorm(1 - alpha / 2) * sd(x) / sqrt(N)
  
  ci
}

# Define function to get coverage probablity
cov.prob = function(N, P) {
  # Simulate 10000 times
  ci.mat = replicate(1000, conf.int(N, P))
  
  # Proportion of times interval is correct
  mean((P >= ci.mat[1,]) * (P <= ci.mat[2,]))
}

# Get all possible combinations of N and P
combinations = expand.grid(N, P)
NP = (combinations$Var1 * combinations$Var2)

# Get coverages for combinations
coverage = apply(combinations, 1, function(x) {cov.prob(x[1], x[2])})

# Plot the coverage against N * P
par(mfrow = c(2, 2))
plot(NP, coverage, ylim = c(0.85, 0.96), xlab = "Product of N and P", ylab = "Coverage Probablity", main = "Plot of Coverage Probability Vs. Product of N and P")

# Plot coverage against N and P
plot(combinations$Var1, coverage, ylim = c(0.85, 0.96), xlab = "N", ylab = "Coverage Probablity", main = "Plot of Coverage Probability Vs. N")
plot(combinations$Var2, coverage, ylim = c(0.85, 0.96), xlab = "P", ylab = "Coverage Probablity", main = "Plot of Coverage Probability Vs. P")