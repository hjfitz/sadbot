#!/usr/bin/env python

from random import randint

randSpaces = randint(1,20)
randSpaces = randSpaces * " "
randColor  = randint(0,16)
randMessage= randint(0,5)
shib       = "top error"

if randMessage == 0:
    shib = "wow"
elif randMessage == 1:
    shib = "such computer"
elif randMessage == 2:
    shib = "top shitpost"
elif randMessage == 3:
    shib = "so shitpost"
elif randMessage == 4:
    shib = "waow"
elif randMessage == 5:
    shib = "all of interned"
elif randMessage == 6:
    shib = "very 1338"
elif randMessage == 7:
    shib = "most linux"

print("\x03" + str(randColor) + randSpaces + shib)
