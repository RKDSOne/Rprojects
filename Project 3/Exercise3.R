# Define data
single.parent.prob = 61 / 414
two.parent.prob = 74 / 501
alpha = 0.05

# Get standard error
SE = sqrt((single.parent.prob * (1 - single.parent.prob) / 414) + (two.parent.prob * (1 - two.parent.prob) / 501))

# Compute 95% confidence interval
c.l.crit = qnorm(alpha / 2) * SE
c.u.crit = qnorm(1 - alpha / 2) * SE
c(two.parent.prob - single.parent.prob + c.l.crit, two.parent.prob - single.parent.prob + c.u.crit)