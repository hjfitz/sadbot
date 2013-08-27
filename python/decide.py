#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Takes options separated by 'or' and returns one by random.
# by andri
from sys import argv
from random import choice

# Makes a list of all the options that are separated by " or "
i = ' '.join(argv[2:]).split(' or ')
# Returns a random option from the list
print choice(i)
