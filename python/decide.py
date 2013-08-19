#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Takes options separated by 'or' and returns one by random.
# by andri
from sys import argv
from random import choice

i = ' '.join(argv[2:]).split(' or ')
print choice(i)
