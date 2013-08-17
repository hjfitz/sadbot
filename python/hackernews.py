#!/usr/bin/env python
# Gives Hacker News article 1-30 in order
# by andri
import urllib2

# Worst possible way of counting from 1 to 30 on a text file, but the best I could think of
try:
    with open("hncounter") as f:
        num = int(f.readlines()[0])
    if num >= 1 and num < 30:
        num+=1
    else:
        num = 1
    with open("hncounter", "w") as f:
        f.write(str(num))
except IOError: # Creates file if doesn't exist
    with open("hncounter", "w") as f:
        num = 1
        f.write(str(num))

# Gets the line where the action happens from Hacker News
a = urllib2.urlopen("https://news.ycombinator.com/news").readlines()[20]
# Sets the location to the number of the article
loc = a.find(str(num)+'.')

# Gets the url and title of the article with the current set number in a horrible horrible manner
url = a[a.find('<a href=',loc)+9:a.find('">',a.find('<a href=',loc))]
title = a[a.find('">',a.find('<a href=',loc))+2:a.find('</a>',a.find('">',a.find('<a href=',loc)))]

# Shortens the URL with is.gd, which is p. short
b = urllib2.urlopen("http://is.gd/create.php?url=%s" %url).readlines()[0]
url = b[b.find('value="')+7:b.find('" ons',b.find('value="'))]

print title,'-', url
