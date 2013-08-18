#!/usr/bin/env python
# That really rustled my jimmies.
# by andri

from random import choice
from sys import argv

with open('/usr/share/dict/words') as f:
    if len(argv) < 4:
        l = f.readlines()
        ed = filter(lambda i: i[-3:-1] == 'ed', l)
        ies = filter(lambda i: i[-4:-1] == 'ies', l)
        verb = choice(ed).strip('\n')
        noun = choice(ies).strip('\n')
        print 'That really %s my %s.' %(verb, noun)
    else:
        verb = argv[2]
        noun = argv[3]
        print 'That really %s my %s.' %(verb, noun)
