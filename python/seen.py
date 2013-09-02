#!/usr/bin/env python
# Shows when nick was last seen
# Usage: seen.py "raw irc data" nick
# by andri
import sys

logdir = "logs/"
# Checks if a nick entered, because this script needs an argument
if len(sys.argv) == 2 or sys.argv[2].strip(' ') == '':
    print "Seen whom?"
    sys.exit()
else:
    nick = sys.argv[2]

# Gets channel from raw irc data, replaces slashes with dashes
channel = sys.argv[1].split(' ')[2].replace('/','-')

# Assumes that the logs are in the log directory with the same name as the channel, but slashes are replaced with dashes
# Then opens the log
with open(logdir+channel) as f:
    # Turns the log into a list
    f = f.read().split('\n')
    # Filters the log, so that only the lines of the nick remain
    # This might need to be changed depending on the log layout
    # Lowering both, so the nicks aren't case sensitive
    f = filter(lambda x: ': <'+nick.lower()+'> ' in x.lower(), f)
    # If the log is empty, the nick hasn't been seen
    if len(f) > 0:
        # Sets the last message in the filtered log to the last variable
        last = f[-1]
        # Sets the time and message from the last variable
        time = ' '.join(last.split(' ')[0:2])[:-1]
        msg = last[last.lower().find(' <'+nick.lower()+'> ')+len(nick)+4:]
        # Returns when the nick was last seen and what they were saying
        print "%s was last seen on %s saying \"%s\"" %(nick, time, msg)
    else: 
        print "Sorry, I haven't seen %s." %nick
