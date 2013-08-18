#!/usr/bin/env python
# Python sandbox script
# by andri
import urllib2
from sys import argv

url = "http://tumbolia.appspot.com/py/"
a = ' '.join(argv[2:])
b = urllib2.urlopen(url + urllib2.quote(a)).readlines()[0].strip('\n')[:400]

if b:
    print b
else:
    print 'sry but na'
