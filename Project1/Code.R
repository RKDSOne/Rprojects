# Get 10000 draws
# Simulate the block execution times
# Simulate X by taking max of block execution times
X = replicate(10000, max(rexp(3, 0.2)))

# Plot the histogram
par(mfrow = c(1, 1))
hist(X, freq = FALSE, probability = TRUE, main="Draws of X", col = gray(.95), breaks = 20, ylim = c(0, 0.09))

# Compute the density function
den = function(x) {
  # Get the exponential function
  e = exp(-0.2 * x)
  
  # Write density equation
  density.eqn = 0.6 * ((1- e) ^ 2) * e
  
  # Return the computed density
  density.eqn
}

# Superimpose the density function
curve(den(x), 0, 100, col = 2, add = TRUE)

# Estimate E(X) and compare with the exact answer 5 times
answer.exact = 9.167
for (index in 1:5){
  # Print the comparison
  cat("n = 10000,", index, "- Differnce in E(X) and exact answer:", mean(X) - answer.exact, "\n")
  
  # Simulate again
  X = replicate(10000, max(rexp(3, 0.2)))
}

# Repeat with n = 1000 and n = 100000
for (n in c(1000, 100000)){
  for (index in 1:5){
    # Simulate
    X = replicate(n, max(rexp(3, 0.2)))
    
    # Print the comparison
    cat("n =", n, ",", index, "- Differnce in E(X) and exact answer:", mean(X) - answer.exact, "\n")
  }
}