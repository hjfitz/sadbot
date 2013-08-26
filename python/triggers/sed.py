#!/usr/bin/env python
# sed spaghetti but it works
# by andri
from sys import argv
import os

# This script is executed every time a PRIVMSG happens
# Get nick, channel and PRIVMSG from argv
nick = '<'+argv[1]+'>'
channel = argv[2].split(' ')[2]
sed = ' '.join(argv[3:]).strip(' ')

# Replace escaped slashes, because they would interfer with what it's about to do
# Hopefully nobody will ever say <OMGASLASH>
sed.replace('\\/','<OMGASLASH>')

# If PRIVMSG starts with s/ and there's another / in there somewhere
if sed[:2] == "s/" and "/" in sed[2:]:
    # Open the log for the current channel, should be in the format of "logs/#channelname"
    # Otherwise change this
    # Slashes should be replaced with dashes
    with open("logs/%s" %channel.replace('/','-')) as f:
        f = f.read().split('\n')[::-1]
        for i in f:
            if nick in i:
                # Finds last occurrence of the nick who wants to sed
                msg = i[i.find(nick)+len(nick)+1:]
                break
            else: # This is used to break out of 2 loops
                continue
            break
    # Checks if the second last character is a slash
    if sed[-2:] == "/g":
        # The last character is the thing after the slash, for example /g
        ye = "g"
    else:
        ye = ""
    i, o = sed.split('/')[1:3]
    # <OMGASLASH> is replaced by an escaped slash once again
    i, o = i.replace('<OMGASLASH>','\\/'), o.replace('<OMGASLASH>', '\\/')
    # Uses os.popen to finally execute the command
    a = os.popen("echo \"%s\" | sed 's/%s/%s/%s'" %(msg, i, o, ye)).read().replace('\n','')
    print nick, a
