#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Use this to add a lastfm username for your nick
# by andri
from sys import argv
from sys import exit
if len(argv) > 2:
    n = argv[1]
    m = argv[2]
else:
    exit('na')
try:
    with open('data/lastfm') as f:
        l = f.readlines()[0]
except IOError:
    l = ""
if ">"+n in l:
    with open('data/lastfm','w') as f:
        i = l[l.find('>'+n+'|')+len(n)+2:l.find('<',l.find('>'+n+'|'))]
        l = l.replace(i,m)
        f.write(l)
        print "Replaced %s with %s for %s." %(i,m,n)
else:
    with open('data/lastfm','w') as f:
        f.write('%s>%s|%s<' %(l,n,m))
        print "Added %s for %s." %(m,n)
