#!/usr/bin/env python
# Google calculator http://www.google.com/ig/calculator
# by andri
from sys import argv
import urllib2

a = ' '.join(argv[1:])
a = a.encode('utf-8')
b = urllib2.urlopen("http://www.google.com/ig/calculator?q=%s" %urllib2.quote(a))
b = b.readlines()[0]
b = b[b.find('rhs: "')+6:b.find('",e')]
if b:
    print b
else:
    print 'top na'
