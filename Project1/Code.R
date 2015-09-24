# Get 10000 draws
f = function(n, X = c()){
  for(index in 1:n) {
    # Simulate the block execution times
    # Simulate X by taking max of block execution times
    X[index] = max(rexp(3, 0.2))
  }
  
  # Return X
  X
}

# Plot the histogram
par(mfrow = c(1, 1))
X = f(10000)
hist(X, freq = FALSE, probability = TRUE, from = min(X), to = max(X), main="Draws of X", col = gray(.95))

# Superimpose the density function
curve(dnorm(x, mean = mean(X), sd = sd(X)), col = 2, add = TRUE)

# Estimate E(X) and compare with the exact answer 5 times
answer.exact = 9.167
for (index in 1:5){
  # Print the comparison
  cat("n = 10000,", index, "- Differnce in E(X) and exact answer:", mean(X) - answer.exact, "\n")
  
  # Simulate again
  X = f(10000)
}

# Repeat with n = 1000 and n = 100000
for (n in c(1000, 100000)){
  for (index in 1:5){
    # Simulate
    X = f(n)
    
    # Print the comparison
    cat("n =", n, ",", index, "- Differnce in E(X) and exact answer:", mean(X) - answer.exact, "\n")
  }
}