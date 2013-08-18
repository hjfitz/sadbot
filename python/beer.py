#!/usr/bin/env python
# Beer hander
# by andri
from sys import argv

if len(argv) == 2:
    recipient = argv[1]
else:
    recipient = ' '.join(argv[2:]).strip(' ')

print "[me] hands %s a beer." %recipient
