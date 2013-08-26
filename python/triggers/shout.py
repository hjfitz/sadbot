# !/usr/bin/env python
# shoutbot handler
# by Corg-kun

from sys import argv
from random import choice

#concatenate message into a single string.
message = ' '.join(argv[2:])
#open balcklist for reading
with open("./data/shoutblacklist", "r") as bl:
    #check if message was shouted, is greater than 5 characters in length and person who
    #shouted is not in the blacklist
    if message.upper() == message and len(message) > 4 and argv[1] not in bl.read().splitlines():
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


