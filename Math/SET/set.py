import random
x1 = random.randint(1, 10)
x2 = random.randint(3, 15)
x3 = random.randint(2, 9)

a = set({x1})
b = set({x2})
c = set({x3})

union = a.union(b)
intersection = a.intersection(b)
difference = a.difference(b)
sym_difference = a.symmetric_difference(b)

y1 = input("Choose an action (union, intersection, difference or sym_difference): ")
y2 = set(input("Input a first set: "))
y3 = set(input("Input a second set: "))

if y1 == 'union':
    print(y2.union(y3))
elif y1 == 'intersection':
    print(y2.intersection(y3))
elif y1 == 'difference':
    print(y2.difference(y3))
elif y1 == 'sym_difference':
    print(y2.difference(y3))
else:print("Choose a correct action")
