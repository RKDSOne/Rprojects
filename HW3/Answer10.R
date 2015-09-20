# Exponential
mean.exp = function(n = 100) mean(rexp(n, 1 / 10))
median.exp = function(n = 100) median(rexp(n, 1 / 10))

# T distribution
mean.t = function(n = 100) mean(rt(n, 2))
median.t = function(n = 100) median(rt(n, 2))

# Side by side box Plot
par(mfrow = c(1, 2))
x = (simple.sim(100, mean.exp)) / var(simple.sim(100, median.exp))
boxplot(x)
x = (simple.sim(100, mean.t)) / var(simple.sim(100, median.t))
boxplot(x)