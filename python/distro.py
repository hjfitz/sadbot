#!/usr/bin/env python
# Random or specific distro finder
# by andri
import urllib2
from sys import argv
if len(argv) == 1:
    site = urllib2.urlopen("http://distrowatch.com/random.php")
    lel = site.geturl()
    distro = "%s - %s" %(site.readlines()[1].strip('\n').replace('<title>DistroWatch.com: ','').replace('</title>',''),lel)
    print distro
    quit()
else:
    a = ' '.join(argv[1:])
    site = urllib2.urlopen("http://distrowatch.com/table.php?distribution=%s" %a)
    lel = site.geturl()
    bimp = site.readlines()[1].strip('\n').replace('<title>DistroWatch.com: ','').replace('</title>','')
    if bimp != "":
        distro = "%s - %s" %(bimp,lel)
    else:
        distro = "Did not find distro named %s." %a
    print distro
