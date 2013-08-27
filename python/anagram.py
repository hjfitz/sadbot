#!/usr/bin/env python
# Gives anagram from input consisting of 7 to 30 letters using anagramgenius.com
# by andri
import urllib2
from sys import argv

# URL of what anagram service to use minus the input text
url = "http://www.anagramgenius.com/server.php?source_text="
# Hopefully anagramgenius.com never closes down

word = '+'.join(argv[2:]) # The arguments are concatenated with pluses

# The service doesn't like words under 7 and over 30, so I'm making sure that the input meets the requirements
if len(word) >= 7 and len(word) <= 30:
    # Opens the 76th line of the site because that's where all the fun is
    site = urllib2.urlopen(url+word).readlines()[75]
    # Gets the output anagram of the word in a retarded fashion
    ey = site[site.find("""o<br><span class="black-18">""")+29:-16]
    # Here's a hacky error detection system
    # Sometimes it would return this if the input was something like ZZZZXZXZXZZXZ
    if ey != " you and your friends' names below:":
        print ey
    else: 
        print "No anagrams found."
else: 
    print "Please keep the length of the input 7 to 30 letters."
