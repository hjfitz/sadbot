#!/usr/bin/env python
# Beer hander
# by andri
from sys import argv

# If there are no arguments (and the argv length is only 2), it uses the nick of the command executor
# Otherwise gets the nick from arguments
if len(argv) == 2:
    recipient = argv[1]
else:
    recipient = ' '.join(argv[2:]).strip(' ')

# [me] is the ACTION keyword for the bot
print "[me] hands %s a beer." %recipient
