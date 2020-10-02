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
