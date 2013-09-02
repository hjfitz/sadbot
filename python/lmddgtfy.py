#!/usr/bin/env python
# Let Me DuckDuckGo That For You
# by andri
from urllib2 import quote
import sys

msg = quote(' '.join(sys.argv[1:]))

# Checks for argument
if msg.strip(' ') == '':
    sys.exit('No input')
# Uses urllib2's quote function to turn the input into a proper URL input
url = "https://lmddgtfy.net/?q="

# That's pretty much it
# It doesn't even connect to the web
print url + msg
