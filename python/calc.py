#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Google calculator http://www.google.com/ig/calculator
# by andri
from sys import argv
import urllib2

url = "http://www.google.com/ig/calculator?q="
a = ' '.join(argv[2:])
b = urllib2.urlopen(url + urllib2.quote(a))
b = b.readlines()[0]
b = b[b.find('rhs: "')+6:b.find('",e')]
b = b.decode('unicode-escape')
b = b.replace(u'\xc2\xa0', ',').replace('<sup>', '^(').replace('</sup>', ')').replace('&#215;','x')
if b:
    print b
else:
    print 'top na'
