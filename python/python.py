#!/usr/bin/env python
# Python sandbox script
# by andri
import urllib2
from sys import argv

url = "http://tumbolia.appspot.com/py/"
a = ' '.join(argv[1:]).encode('utf-8')
b = urllib2.urlopen(url + urllib2.quote(a)).readlines()[0].strip('\n')

if b:
    print b
else:
    print 'sry but na'
