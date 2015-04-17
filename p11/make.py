import random
# make a square input file
side = 10000

print side
print side

for y in xrange(0,side):
    for x in xrange(0,side):
        print str(random.randrange(0,99)).zfill(2),
    print
