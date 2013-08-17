#!/usr/bin/env python
# by andri

from random import choice
from sys import argv

with open('/usr/share/dict/words') as f:
    l = f.readlines()
    if len(argv) < 3:
        verb = choice(l).strip('\n')
        noun = choice(l).strip('\n')
        print 'That really %sed my %sies.' %(verb, noun)
    else:
        verb = argv[1]
        noun = argv[2]
        print 'That really %s my %s.' %(verb, noun)
