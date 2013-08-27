#!/usr/bin/env python
# That really rustled my jimmies.
# by andri
from random import choice
from sys import argv

# Opens the dictionary file in /usr/share/dict
# If this doesn't exist, find it from the internet or make your own
with open('/usr/share/dict/words') as f:
    # Checks the number of arguments
    # If there are 2 arguments or more, uses the arguments for the words
    # Otherwise returns random ones
    if len(argv) < 4:
        l = f.read().split('\n')
        # Filters the dictionary twice to make 2 lists
        # One has words that end with ed and the other words that end with ies
        ed = filter(lambda i: i[-2:] == 'ed', l)
        ies = filter(lambda i: i[-3:] == 'ies', l)
        # Gets random words from the lists
        verb = choice(ed)
        noun = choice(ies)
        # Returns the sentence
        print 'That really %s my %s.' %(verb, noun)
    else:
        # Gets words from the arguments
        verb = argv[2]
        noun = argv[3]
        # Returns the sentence
        print 'That really %s my %s.' %(verb, noun)
