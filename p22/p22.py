def name_score(name):
    accum = 0
    for char in name:
        accum += ord(char) - ord('A') + 1
    return accum

namesFile = open('names.txt', 'r')
names = [name.replace('"','') for name in namesFile.read().split(',')]
names = sorted(names)

accum = 0
for i, name in enumerate(names):
    accum += (i+1)*name_score(name)

print accum
