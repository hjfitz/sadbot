#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Google calculator http://www.google.com/ig/calculator
# by andri
from sys import argv
import urllib2

url = "http://www.google.com/ig/calculator?q="
a = ' '.join(argv[2:]) # This is the input
b = urllib2.urlopen(url + urllib2.quote(a)) # This is the output of the calculator API
# Something like this: {lhs: "2 * 2",rhs: "4",error: "",icc: false}

# Sorting the output a bit
b = b.readlines()[0]
# Doo doo doo dee dooo
b = b[b.find('rhs: "')+6:b.find('",e')]
# Some of this
b = b.decode('unicode-escape')
# Some of that
b = b.replace(u'\xc2\xa0', ',').replace('<sup>', '^(').replace('</sup>', ')').replace('&#215;','x')
# Boom prints the output if there is any
if b:
    print b
else:
    print 'top na'
