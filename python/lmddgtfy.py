#!/usr/bin/env python
# Let Me DuckDuckGo That For You
# by andri
from urllib2 import quote
from sys import argv

msg = quote(' '.join(argv[1:]))
url = "https://lmddgtfy.net/?q="

print url + msg
