# !/usr/bin/env python
# shoutbot handler
# by Corg-kun

from sys import argv
from random import choice

#concatenate message into a single string.
message = ' '.join(argv[1:])
#check if message was shouted and greater than 5 characters in length.
if message.upper() == message and len(message) > 4:
    #open shout messages db file
    with open("./data/shoutdb", 'r+') as f:
        #creat a list of strings of past shouted messages.
        db = f.read().splitlines()
        #randomly choose an element from the db and shout it back.
        out = choice(db)
        print out
        #check to see if the message already exists in the db, if so, return a line
        #from the db but do not write the new message it to the db.
        if not message in db:
            f.write(message + '\n')


