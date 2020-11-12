# The probability that the shooter will hit the target by firing once is 0.8.
# the Shooter fired 100 times.
# Find the probability that the shooter will hit the target exactly 85 times

from math import factorial, exp

def Poisson_distribution(m, n, p):
    la = p*n
    return (la**m)/(factorial(m))*(exp(1)**-la)

def Binom_function(n, p=0.8, q=0.2):
    sum = []
    for k in range(n+1):
        y = (factorial(n)/(factorial(k)*factorial(n-k)))*p**k*q**(n-k)
        sum.append(y)
    return sum

print("the probability that the shooter will hit the target exactly 85 times is (Poisson)",Poisson_distribution(85, 100, 0.8))
print("the probability that the shooter will hit the target exactly 85 times is (Binom)",Binom_function(100)[85])

# The probability that the light bulb will burn out during the first day of operation is 0.0004.
# 5,000 new light bulbs were turned on in a residential complex after renovation in one day.
# What is the probability that none of them will burn out on the first day?
# What is the probability that exactly two will burn out?

print("the probability that none of them will burn out on the first day is ",Poisson_distribution(0, 5000, 0.0004))
print("the probability that exactly two will burn out is ",Poisson_distribution(2, 5000, 0.0004))

# The coin was flipped 144 times.
# What is the probability that the eagle will fall exactly 70 times?

def Binom_function_2(n, p=0.5, q=0.5):
    sum = []
    for k in range(n+1):
        y = (factorial(n)/(factorial(k)*factorial(n-k)))*p**k*q**(n-k)
        sum.append(y)
    return sum

print('the probability that the eagle will fall exactly 70 times is ',Binom_function_2(144)[70])

# The first box contains 10 balls, 7 of which are white.
# In the second box - 11 balls, of which 9 are white.
# Two balls are randomly drawn from each box.
# What is the probability that all the balls are white?
# What is the probability that exactly two balls are white?
# What is the probability that at least one ball is white?

print('the probability that all the balls are white is', 7/10*6/9*9/11*8/10)

def all_combinations(n, k):
    x = factorial(n)/(factorial(k)*factorial(n-k))
    return x

def two_balls_are_white():
    x = all_combinations(16, 4)
    return x

print('the probability that exactly two balls are white is', two_balls_are_white()/all_combinations(21,4))
print('the probability that at least one ball is white',
      (all_combinations(16, 1)+all_combinations(16, 2)+all_combinations(16, 3)+all_combinations(16, 4))
      /all_combinations(21,4))
