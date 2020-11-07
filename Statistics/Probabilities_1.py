# 4 cards are randomly drawn from a 52-card deck.
# a) Find the probability that all cards are clubs.
# b) Find the probability that there will be at least one ACE among the 4 cards

from math import factorial

def all_combinations(n, k):
    x = factorial(n)/(factorial(k)*factorial(n-k))
    return x

def all_clubs():
    x = all_combinations(13, 4)
    return x

print("The probability of 'a)' is {}".format(all_clubs()/all_combinations(52,4)))
print("The probability of 'b)' is {}".format(
    all_combinations(4,1)*all_combinations(48,3)/all_combinations(52,4)))

# A combination lock is installed on the entrance door of the entrance,
# ten buttons with digits from 0 to 9. The code contains three digits,
# that need to be clicked simultaneously.
# What is the probability that a person who doesn't know the code will open the door on the first try?

print("The probabilirt of the first attempt is: ", 1/10**3)

# There are 15 parts in the box, 9 of which are painted.
# The worker randomly extracts 3 parts.
# What is the probability that all extracted parts are colored?

print("The probability is: ", 9/15*8/14*7/13)

# There are 100 tickets in the lottery. 2 of them are winning ones.
# What is the probability that 2 purchased tickets will be winning?

print("The probability is: ", 1/100*1/100)
