#!/usr/bin/env python
# Gives anagram from input consisting of 7 to 30 letters. 
# by andri
import urllib2
from sys import argv

word = '+'.join(argv[1:])
if len(word) >= 7 and len(word) <= 30:
    site = urllib2.urlopen("http://www.anagramgenius.com/server.php?source_text=%s" %word).readlines()[75]
    ey = site[site.find("""o<br><span class="black-18">""")+29:-16]
    print ey
else: 
    print "Please keep the length of the input 7 to 30 letters."
