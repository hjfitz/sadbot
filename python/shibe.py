#!/usr/bin/env python

import random

randSpaces = random.randint(1,20)
randSpaces = randSpaces * " "
randColor  = random.randint(0,16)
randMessage= random.randint(0,5)
shibArray  = [
        "wow",
        "such computer",
        "top shitpost",
        "much andri",
        "much spectrum",
        "much computer",
        "top shibe",
        "so shitpost",
        "waow",
        "all of interned",
        "very 1338",
        "most linux",
        ]

shib = random.choice(shibArray)

print("\x03" + str(randColor) + randSpaces + shib)
