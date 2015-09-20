# Simulate a normal two times
x1 = rnorm(10, 10, 10)
x2 = rnorm(10, 100, 100)

# Compare simulations
par(mfrow = c(1,2))
hist(x1)
hist(x2)