#!/usr/bin/env python
# Gives anagram from input consisting of 7 to 30 letters using anagramgenius.com
# by andri
import urllib2
from sys import argv

url = "http://www.anagramgenius.com/server.php?source_text="
word = '+'.join(argv[1:])
if len(word) >= 7 and len(word) <= 30:
    site = urllib2.urlopen(url+word).readlines()[75]
    ey = site[site.find("""o<br><span class="black-18">""")+29:-16]
    if ey != " you and your friends' names below:":
        print ey
    else: 
        print "No anagrams found."
else: 
    print "Please keep the length of the input 7 to 30 letters."
