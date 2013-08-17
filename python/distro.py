#!/usr/bin/env python
# Uses distrowatch.com to return a random distro or find one
# by andri
import urllib2
from sys import argv

i = "http://distrowatch.com/"
# If no arguments are given, it gives you a random distro with random.php
if len(argv) == 1:
    site = urllib2.urlopen(i + "random.php")
    distro = site.readlines()[1][24:-9]
    url = site.geturl()
    print distro,'-',url
else:
    # Only uses the first argument, because 2 or more won't make a difference
    # For example, ankur still returns Ankur Bangla and damn returns Damn Small
    a = argv[1]
    site = urllib2.urlopen(i + "table.php?distribution=%s" %a)
    distro = site.readlines()[1][24:-9]
    url = site.geturl()
    if distro != "":
        print distro,'-',url
    else:
        print "Did not find distro named %s." %a
