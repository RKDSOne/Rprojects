# Define the data
n.x = 400
x.mean = 2635
x.sd = 365
n.y = 500
y.mean = 2887
y.sd = 412

# Get degrees of freedom
df.satterth.approx = function(n.x, n.y, s.x, s.y) {
  num = ((s.x ^ 2 / n.x) + (s.y ^ 2 / n.y)) ^ 2
  denom = (s.x ^ 4 / ((n.x ^ 2 * (n.x - 1)))) + (s.y ^ 4/(n.y ^ 2 * (n.y - 1)))
  return (num / denom)
}

df.est = df.satterth.approx(n.x, n.y, x.sd, y.sd)

# Construct 95% CI for difference in mean
CI = n.x - n.y + c(-1, 1) * qt(1 - 0.05 / 2, df = df.est) * sqrt(x.sd ^ 2 / n.x + y.sd ^ 2 / n.y)
CI

# Perform a 5% level test
tstat = (n.x - n.y) / sqrt((x.sd ^ 2 / n.x) + (y.sd ^ 2 / n.y))
pval = (1 - pt(abs(tstat), df.est))
pval