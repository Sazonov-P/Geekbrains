# Given salary values from a sample of graduates:
# 100, 80, 75, 77, 89, 33, 45, 25, 65, 17, 30, 24, 57, 55, 70, 75, 65, 84, 90, 150.
# Calculate: arithmetic mean, mean square deviation,
# biased and an unbiased estimator of the variance for this sample

from math import sqrt, factorial

alumnus = [100, 80, 75, 77, 89, 33, 45, 25, 65, 17, 30, 24, 57, 55, 70, 75, 65, 84, 90, 150]
alumnus_mean = sum(alumnus)/len(alumnus)
alumnus_st_dev = [(x-alumnus_mean)**2 for x in alumnus]
alumnus_st_dev = sqrt(sum(alumnus_st_dev)/(len(alumnus)-1))
alumnus_biased_var = [(x-alumnus_mean)**2 for x in alumnus]
alumnus_biased_var = sum(alumnus_biased_var)/(len(alumnus))
alumnus_unbiased_var = alumnus_st_dev**2

print('mean: ', alumnus_mean,
       '\nst.dev: ', alumnus_st_dev,
      '\nbiased.var: ', alumnus_biased_var,
      '\nunbiased.var: ', alumnus_unbiased_var)


# The first box contains 8 balls, 5 of which are white.
# In the second box - 12 balls, of which 5 are white.
# Two balls are randomly drawn from the first box and 4 from the second.
# What is the probability that 3 balls are white?

def all_combinations(n, k):
    x = factorial(n)/(factorial(k)*factorial(n-k))
    return x

box1_two_white = all_combinations(5, 2) * all_combinations(3, 0) / all_combinations(8, 2)
box_1_one_white = all_combinations(5, 1) * all_combinations(3, 1) / all_combinations(8, 2)
box1_two_black = all_combinations(5, 0) * all_combinations(3, 2) / all_combinations(8, 2)

box2_three_white = all_combinations(5, 3) * all_combinations(7,1)/ all_combinations(12, 4)
box2_two_white = all_combinations(5, 2) * all_combinations(7,2)/ all_combinations(12, 4)
box2_one_white = all_combinations(5, 1) * all_combinations(7,3) / all_combinations(12, 4)

P = box1_two_white*box2_one_white +box_1_one_white*box2_two_white+box1_two_black*box2_three_white

print('\nThe probability that 3 balls are white is: ', P)

# In a biathlon competition, one of the three athletes shoots and hits a target.
# The probability of a hit for the first athlete is 0.9, for the second — 0.8,
# for the third-0.6.
# Find the probability that the shot was fired:
# a). first athlete b). the second athlete in). the third athlete

print('\nthe first athlete: ', 1/3*0.9/(1/3*0.9+1/3*0.8+1/3*0.6))
print('the second athlete: ', 1/3*0.8/(1/3*0.9+1/3*0.8+1/3*0.6))
print('the third athlete: ', 1/3*0.6/(1/3*0.9+1/3*0.8+1/3*0.6))

# The University has an equal number of students enrolled in departments A and B,
# and faculty C has the same number of students enrolled as A and B together.
# The probability that a student of faculty A will pass the first session is 0.8.
# for a student of faculty B, this probability is 0.7, and for a student of faculty C, it is 0.9.
# the Student passed the first session.
# What is the probability that he learns:
# a). at faculty A b). at faculty B C). at faculty C?

print('\nfaculty A: ', 0.25*0.8/(0.25*0.8+0.25*0.7+0.5*0.9))
print('faculty B: ', 0.25*0.7/(0.25*0.8+0.25*0.7+0.5*0.9))
print('faculty C: ', 0.5*0.9/(0.25*0.8+0.25*0.7+0.5*0.9))

#The device consists of three parts.
# For the first part, the probability of failure in the first month is 0.1, for the second - 0.2,
# for the third-0.25.
# What is the probability that the first month will fail:
# a)all items b)only two details c)at least one detail d)from one to two details?

P1 = 0.1
P2 = 0.2
P3 = 0.25

P1_0 = 1- P1
P2_0 = 1- P2
P3_0 = 1- P3

print('\na): ', P1*P2*P3)
print('b): ', P1_0*P2*P3+P2_0*P1*P3+P3_0*P1*P2)
print('c): ', 1-P1_0*P2_0*P3_0)
print('d): ', 1-P1_0*P2_0*P3_0-P1*P2*P3)
