#!/usr/bin/env python
# sed spaghetti for IRC
# Usage: sed.py nick "raw irc data" sed input
# by andri
from sys import argv
from subprocess import Popen, PIPE

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
        # Reads log file, makes it into a list
        f = f.read().split('\n')
        # Filters the list, so only the nick's messages stay
        f = filter(lambda x: nick in x, f)
        # Gets the last message of the nick and makes it a string
        msg = f[-1][f[-1].find(nick)+len(nick)+1:]
    # Checks if the command ends with a /g or /I and writes it to the variable flag
    if sed[-2:] == "/g":
        flag = "g"
    elif sed[-2:] == "/I":
        flag = "I"
    else:
        flag = ""
    i, o = sed.split('/')[1:3]
    # <OMGASLASH> is replaced by an escaped slash once again
    i, o = i.replace('<OMGASLASH>','\\/'), o.replace('<OMGASLASH>', '\\/')
    # Uses subprocess.Popen to safely executed echo and sed
    # First echoes the message
    a = Popen(["echo", msg], stdout = PIPE)
    # Then pipes the echo with sed to substitute the original message
    b = Popen(["sed", "s/%s/%s/%s" %(i, o, flag)], stdin = a.stdout, stdout = PIPE)
    # Then writes the output to a variable and prints it
    c = b.stdout.read().strip('\n')
    
    print nick, c
