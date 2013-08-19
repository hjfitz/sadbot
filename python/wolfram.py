#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Wolfram Alpha
# by andri
from sys import argv
import urllib2

i = urllib2.quote(' '.join(argv[2:]))
u = 'http://tumbolia.appspot.com/wa/'
l = urllib2.urlopen(u+i).readlines()[0].strip('\n')
l = l.replace(';',' | ')
print l
