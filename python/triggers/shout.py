# !/usr/bin/env python
# shoutbot handler
# by Corg-kun

from sys import argv
from random import choice

uniqlines = set(open('./data/shoutdb').readlines())
out = open('./data/shoutdb', 'w').writelines(uniqlines)

#concatenate message into a single string.
message = ' '.join(argv[1:])
#check if message was shouted and greater than 5 characters in length
if message.upper() == message and len(message) > 4:
    #open shout messages db file
    with open("./data/shoutdb", 'r+') as f:
        #creat a list of strings of past shouted messages.
        db = f.read().splitlines()
        #randomly choose an element from the db to shout back
        f.write(message + '\n')
        out = choice(db)
        if not message == out:
            print out


