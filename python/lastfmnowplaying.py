#!/usr/bin/env python
# -*- coding: utf-8 -*-
# last.fm now playing
# by andri
import sys
import urllib2
a = sys.argv[1]

with open('data/lastfm') as f:
    d = f.readlines()[0]
    if '>'+a in d:
        i = d[d.find('>'+a+'|')+len(a)+2:d.find('<',d.find('>'+a+'|'))]
    else:
        sys.exit('Please use ":addnick" to add your username first!')

u = "http://www.last.fm/community/users/search?q="
l = urllib2.urlopen(u+i).readlines()[425].strip('\n').strip(' ')
if l[:6] == "</div>":
    print 'na'
else:
    artist = l[l.find('">',40)+2:l.find('</a>')]
    if l[10:14] == "last":
        track = l[l.find('   >')+4:-8]
        print '%s last listened to %s - %s.' %(i,artist,track)
    elif l[10:13] == "now":
        track = l[l.find('   >')+4:-15]
        print '%s is listening to %s - %s.' %(i,artist,track)
