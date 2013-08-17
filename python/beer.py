#!/usr/bin/env python
# Beer hander
# by andri
from sys import argv

recipient = ' '.join(argv[1:]).strip(' ')
print ">>ACT<< hands %s a beer." %recipient
