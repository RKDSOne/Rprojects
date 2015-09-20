# Create 100 random number in normal
x = rnorm(100)

# Find percent of elements in 1, 2, 3 standard deviations
n = length(x)
for (sigma in 1:3){
  cat("" , sigma , "standard deviation: ", sum(-sigma < x & x < sigma) / n, "\n")
}