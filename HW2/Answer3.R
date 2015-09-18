#Generate normal distribution
mean = 100
sd = 10
x = rnorm(100, mean, sd)
x

# Find numbers 2 sd away from mean
x[abs(mean - x) > 2 * sd]