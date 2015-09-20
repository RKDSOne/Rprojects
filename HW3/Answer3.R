# Bernoulli with p = .25
x1 = rbinom(1, 100, 0.25)

# P = .05
x2 = rbinom(1, 100, 0.05)

# P = .01
x3 = rbinom(1, 100, 0.01)

# Plot
par(mfrow = c(1, 3))
hist(x1, probability = TRUE,main="p=.25",col = gray(.95))
hist(x2, probability = TRUE,main="p=.05",col = gray(.95))
hist(x3, probability = TRUE,main="p=.01",col = gray(.95))