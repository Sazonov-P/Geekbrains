# It is known that the General population is distributed normally
# with a mean square deviation of 16.
# Find the confidence interval for estimating the mathematical expectation a with a reliability of 0.95,
# if the sample average is M = 80 and the sample size is n = 256.

Tkp = 1.96
x_min = 80-1.96
x_max = 80+1.96
print(f"Confidence interval is: {x_min} ; {x_max} \n")

# As a result of 10 independent measurements of a certain value X, performed with the same accuracy,
# experimental data obtained: 6.9, 6.1, 6.2, 6.8, 7.5, 6.3, 6.4, 6.9, 6.7, 6.1
# Assuming that the measurement results are subject to the normal law of probability distribution,
# estimate the true value of x using a confidence interval,
# covering this value with a confidence probability of 0.95. 3.4 solve problems using hypothesis testing

from statistics import mean, stdev
from math import sqrt
x = [6.9, 6.1, 6.2, 6.8, 7.5, 6.3, 6.4, 6.9, 6.7, 6.1]
Tkp = 2.26
x_mean = mean(x)
x_stdev = stdev(x)

x_min = x_mean-(Tkp*x_stdev)/(sqrt(len(x)))
x_max = x_mean+(Tkp*x_stdev)/(sqrt(len(x)))

print(f"Confidence interval is: {x_min} ; {x_max} \n")

# It is claimed that bearing balls made by an automatic machine have an average diameter of 17 mm.
# Using a one-way criterion with α=0.05, test this hypothesis if the sample of n=100 balls has an average diameter of
# turned out to be equal to 17.5 mm, and the variance is known and equal to 4 sq. mm.
Tkp = 1.65
z = (17.5-17.0)/(sqrt(4)/sqrt(100))
print(f"Because the Z ({z}) greater than Tkp ({Tkp}), the hypothesis is not correct \n")

# The seller claims that the average weight of a pack of cookies is 200 g.
# A sample of 10 bundles was extracted from the batch. The weight of each pack is:
# 202, 203, 199, 197, 195, 201, 200, 204, 194, 190.
# It is known that their weights are distributed normally.
# Is the seller's statement true, given that the confidence probability is 99%?

x = [202, 203, 199, 197, 195, 201, 200, 204, 194, 190]
x_mean = mean(x)
x_stdev = stdev(x)

z = (x_mean-200)/(x_stdev/sqrt(len(x)))
Tkp = 3.25

print(f"Because the Z ({z}) less than Tkp ({Tkp}), the hypothesis is correct \n")
