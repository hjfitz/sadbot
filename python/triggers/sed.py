#!/usr/bin/env python
# sed spaghetti but it works
# by andri
from sys import argv
import os

nick = '<'+argv[1]+'>'
channel = argv[2].split(' ')[2]
sed = ' '.join(argv[3:])

print sed
if sed[:2] == "s/" and "/" in sed[2:]:
    if '\\' in sed:
        print "sry but na"
    else:
        with open("logs/%s.txt" %channel.replace('/','_')) as f:
            f = f.read().split('\n')[::-1]
            for i in f:
                if nick in i:
                    msg = i[i.find(nick)+len(nick)+1:]
                    break
                else:
                    continue
                break
        print msg
        if sed[-2:] == "/g":
            ye = "g"
        else:
            ye = ""
        i, o = sed.split('/')[1:3]
        a = os.popen("echo \"%s\" | sed 's/%s/%s/%s'" %(msg, i, o, ye)).read().replace('\n','')
        print a
